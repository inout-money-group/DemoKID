import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'kid_share.freezed.dart';

@freezed
class KIDShare with _$KIDShare {
  const factory KIDShare({
    required String encryptionKey,
    required File encryptedFile,
  }) = _KIDShare;
}
