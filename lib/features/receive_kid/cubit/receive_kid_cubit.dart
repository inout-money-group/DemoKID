import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:encrypt/encrypt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

import '../../../core/models/kid.dart';

part 'receive_kid_state.dart';
part 'receive_kid_cubit.freezed.dart';

@injectable
class ReceiveKidCubit extends Cubit<ReceiveKidState> {
  ReceiveKidCubit() : super(const ReceiveKidState.initial());

  void receiveFile(File file) {
    if (extension(file.path) != '.kid') {
      emit(const ReceiveKidState.error(
        message:
            'Udostępniono zły typ pliku. Aplikacja obsługuje tylko pliki o rozszerzeniu .kid',
      ));
      return;
    }

    emit(ReceiveKidState.received(file: file));
  }

  Future<bool> decryptFile(String keyString, File encryptedFile) async {
    // Read file contents
    final strings = await encryptedFile.readAsLines();
    // Check if the file has been read properly
    if (strings.length != 2) {
      emit(const ReceiveKidState.error(message: 'Wystąpił błąd'));
      return false;
    }

    // Decode base64 strings to byte lists
    final ivDecoded = base64.decode(strings.first);
    final contentDecoded = base64.decode(strings.last);

    // Create input vector and key from encrypt package
    final iv = IV(ivDecoded);
    final key = Key.fromUtf8(keyString);

    // Create the encrypter with AES cbc mode passing the encryption key
    final encrypter = Encrypter(
      AES(
        key,
        mode: AESMode.cbc,
      ),
    );

    // Decrypt the file with given input vector
    try {
      final contentDecrypted = encrypter.decrypt(
        Encrypted(contentDecoded),
        iv: iv,
      );

      // Emit a proper state
      final kidString = utf8.decode(base64Decode(contentDecrypted));

      // Save the string to secure storage
      await const FlutterSecureStorage().write(key: 'kid', value: kidString);

      final kid = KID.fromJson(jsonDecode(kidString));
      emit(ReceiveKidState.decrypted(kid: kid));
    } catch (e) {
      return false;
    }

    return true;
  }
}
