// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kid_share.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KIDShare {
  String get encryptionKey => throw _privateConstructorUsedError;
  File get encryptedFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KIDShareCopyWith<KIDShare> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KIDShareCopyWith<$Res> {
  factory $KIDShareCopyWith(KIDShare value, $Res Function(KIDShare) then) =
      _$KIDShareCopyWithImpl<$Res, KIDShare>;
  @useResult
  $Res call({String encryptionKey, File encryptedFile});
}

/// @nodoc
class _$KIDShareCopyWithImpl<$Res, $Val extends KIDShare>
    implements $KIDShareCopyWith<$Res> {
  _$KIDShareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? encryptionKey = null,
    Object? encryptedFile = null,
  }) {
    return _then(_value.copyWith(
      encryptionKey: null == encryptionKey
          ? _value.encryptionKey
          : encryptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedFile: null == encryptedFile
          ? _value.encryptedFile
          : encryptedFile // ignore: cast_nullable_to_non_nullable
              as File,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KIDShareCopyWith<$Res> implements $KIDShareCopyWith<$Res> {
  factory _$$_KIDShareCopyWith(
          _$_KIDShare value, $Res Function(_$_KIDShare) then) =
      __$$_KIDShareCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String encryptionKey, File encryptedFile});
}

/// @nodoc
class __$$_KIDShareCopyWithImpl<$Res>
    extends _$KIDShareCopyWithImpl<$Res, _$_KIDShare>
    implements _$$_KIDShareCopyWith<$Res> {
  __$$_KIDShareCopyWithImpl(
      _$_KIDShare _value, $Res Function(_$_KIDShare) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? encryptionKey = null,
    Object? encryptedFile = null,
  }) {
    return _then(_$_KIDShare(
      encryptionKey: null == encryptionKey
          ? _value.encryptionKey
          : encryptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedFile: null == encryptedFile
          ? _value.encryptedFile
          : encryptedFile // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$_KIDShare implements _KIDShare {
  const _$_KIDShare({required this.encryptionKey, required this.encryptedFile});

  @override
  final String encryptionKey;
  @override
  final File encryptedFile;

  @override
  String toString() {
    return 'KIDShare(encryptionKey: $encryptionKey, encryptedFile: $encryptedFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KIDShare &&
            (identical(other.encryptionKey, encryptionKey) ||
                other.encryptionKey == encryptionKey) &&
            (identical(other.encryptedFile, encryptedFile) ||
                other.encryptedFile == encryptedFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, encryptionKey, encryptedFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KIDShareCopyWith<_$_KIDShare> get copyWith =>
      __$$_KIDShareCopyWithImpl<_$_KIDShare>(this, _$identity);
}

abstract class _KIDShare implements KIDShare {
  const factory _KIDShare(
      {required final String encryptionKey,
      required final File encryptedFile}) = _$_KIDShare;

  @override
  String get encryptionKey;
  @override
  File get encryptedFile;
  @override
  @JsonKey(ignore: true)
  _$$_KIDShareCopyWith<_$_KIDShare> get copyWith =>
      throw _privateConstructorUsedError;
}
