import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kid_demo/core/config/const.dart';
import 'package:kid_demo/core/models/kid.dart';
import 'package:uuid/uuid.dart';

@lazySingleton
class LocalDatasource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String> getUID() async {
    final readUID = await _storage.read(key: Const.ssUIDKey);
    if (readUID != null) {
      return readUID;
    }

    final generatedUID = const Uuid().v4();
    await _storage.write(key: Const.ssUIDKey, value: generatedUID);

    return generatedUID;
  }

  Future<void> saveKID(KID kid) async {
    await _storage.write(
      key: Const.ssKIDKey,
      value: jsonEncode(kid.toJson()),
    );
  }
}
