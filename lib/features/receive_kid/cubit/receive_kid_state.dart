part of 'receive_kid_cubit.dart';

@freezed
class ReceiveKidState with _$ReceiveKidState {
  const factory ReceiveKidState.initial() = _Initial;
  const factory ReceiveKidState.error({
    required String message,
  }) = _Error;
  const factory ReceiveKidState.received({
    required File file,
  }) = _Received;
  const factory ReceiveKidState.decrypted({
    required KID kid,
  }) = _Decrypted;
}
