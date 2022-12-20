import 'package:freezed_annotation/freezed_annotation.dart';

part 'kid.freezed.dart';
part 'kid.g.dart';

@freezed
class KID with _$KID {
  const factory KID({
    required String kidPubliczny,
    required String kidPrywatny,
  }) = _KID;

  factory KID.fromJson(Map<String, dynamic> json) => _$KIDFromJson(json);
}
