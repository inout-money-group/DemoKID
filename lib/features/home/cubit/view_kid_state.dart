part of 'view_kid_cubit.dart';

@freezed
class ViewKidState with _$ViewKidState {
  const factory ViewKidState.initial() = _Initial;
  const factory ViewKidState.loaded({
    required KID? kid,
  }) = _Loaded;
}
