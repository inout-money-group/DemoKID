
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kid.freezed.dart';
part 'kid.g.dart';

@freezed
class KID with _$KID {
  const factory KID({
    required String pub,
    required String prv,
    required String pngBase64,
  }) = _KID;

  factory KID.fromJson(Map<String, dynamic> json) => _$KIDFromJson(json);
}
