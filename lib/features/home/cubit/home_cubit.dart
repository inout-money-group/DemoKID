import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:encrypt/encrypt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:kid_demo/core/models/kid_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../../../core/models/kid.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial()) {
    _init();
  }

  StreamSubscription<List<SharedMediaFile>>? _intentDataStreamSubscription;

  // Set up share receiver
  void _init() {
    // For sharing files coming from outside the app while the app is in the memory
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getMediaStream().listen((
      List<SharedMediaFile> value,
    ) {
      if (value.isNotEmpty) _onFileReceived(value.first);
    });

    // For sharing files coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
      if (value.isNotEmpty) _onFileReceived(value.first);
    });
  }

  Future<void> _onFileReceived(SharedMediaFile file) async {
    // Remove file prefix from path on iOS
    final receivedFile = File(file.path.replaceFirst('file://', ''));

    emit(HomeState.receivedFile(file: receivedFile));
  }

  Future<KIDShare?> getEncryptedKid() async {
    try {
      //* Get the KID from secure storage
      final kidString = await const FlutterSecureStorage().read(key: 'kid');
      if (kidString == null) return null;

      //* Encode the KID to a Base64 string
      final kidBase64 = base64.encode(utf8.encode(kidString));

      //* Generate a random 128 bit key string
      final random = Random.secure();
      final keyString = String.fromCharCodes(
        List.generate(16, (_) {
          final selector = random.nextInt(3);
          switch (selector) {
            case 0:
              return random.nextInt(10) + 48;
            case 1:
              return random.nextInt(25) + 65;
            default:
              return random.nextInt(25) + 97;
          }
        }),
        // Ensure that the key string is always 128 bit long
      ).trim().padRight(16, 'a');
      final key = Key.fromUtf8(keyString);

      //* Generate a random 128 bit input vector
      final iv = IV.fromSecureRandom(16);

      //* Encrypt the KID string
      final encrypter = Encrypter(AES(
        key,
        mode: AESMode.cbc,
      ));
      final kidEncrypted = encrypter.encrypt(kidBase64, iv: iv);

      //* Add the input vector to the beggining of the string
      final resultString = '${iv.base64}\n${kidEncrypted.base64}';

      //* Write the resulting string to a file
      final tempDirPath = (await getTemporaryDirectory()).path;
      final filename = DateFormat('ddMMyyyyHHmm').format(DateTime.now());
      final resultFile = await File('$tempDirPath/$filename.kid').create();
      await resultFile.writeAsString(resultString);

      //* Return the key string and encrypted file
      return KIDShare(
        encryptionKey: keyString,
        encryptedFile: resultFile,
      );

      //* Test code
      // final newEncrypter = Encrypter(AES(
      //   Key.fromUtf8(utf8.decode(base64.decode(key.base64))),
      //   mode: AESMode.cbc,
      // ));
      // final newIv = IV.fromBase64(iv.base64);
      // print(utf8.decode(base64.decode(
      //   newEncrypter.decrypt64(kidEncrypted.base64, iv: newIv),
      // )));
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteKid() async {
    await const FlutterSecureStorage().delete(key: 'kid');
  }

  Future<void> generateKid() async {
    const publicChars = '0123456789';
    const privateChars =
        '${publicChars}AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    final kid = KID(
      kidPubliczny: _getRandom(15, publicChars),
      kidPrywatny: _getRandom(42, privateChars),
    );
    await const FlutterSecureStorage().write(
      key: 'kid',
      value: jsonEncode(kid.toJson()),
    );
  }

  String _getRandom(int length, String charset) {
    final rand = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => charset.codeUnitAt(rand.nextInt(charset.length)),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _intentDataStreamSubscription?.cancel();
    return super.close();
  }
}
