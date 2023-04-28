// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KID _$KIDFromJson(Map<String, dynamic> json) {
  return _KID.fromJson(json);
}

/// @nodoc
mixin _$KID {
  String get pub => throw _privateConstructorUsedError;
  String get prv => throw _privateConstructorUsedError;
  String get pngBase64 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KIDCopyWith<KID> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KIDCopyWith<$Res> {
  factory $KIDCopyWith(KID value, $Res Function(KID) then) =
      _$KIDCopyWithImpl<$Res, KID>;
  @useResult
  $Res call({String pub, String prv, String pngBase64});
}

/// @nodoc
class _$KIDCopyWithImpl<$Res, $Val extends KID> implements $KIDCopyWith<$Res> {
  _$KIDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pub = null,
    Object? prv = null,
    Object? pngBase64 = null,
  }) {
    return _then(_value.copyWith(
      pub: null == pub
          ? _value.pub
          : pub // ignore: cast_nullable_to_non_nullable
              as String,
      prv: null == prv
          ? _value.prv
          : prv // ignore: cast_nullable_to_non_nullable
              as String,
      pngBase64: null == pngBase64
          ? _value.pngBase64
          : pngBase64 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KIDCopyWith<$Res> implements $KIDCopyWith<$Res> {
  factory _$$_KIDCopyWith(_$_KID value, $Res Function(_$_KID) then) =
      __$$_KIDCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pub, String prv, String pngBase64});
}

/// @nodoc
class __$$_KIDCopyWithImpl<$Res> extends _$KIDCopyWithImpl<$Res, _$_KID>
    implements _$$_KIDCopyWith<$Res> {
  __$$_KIDCopyWithImpl(_$_KID _value, $Res Function(_$_KID) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pub = null,
    Object? prv = null,
    Object? pngBase64 = null,
  }) {
    return _then(_$_KID(
      pub: null == pub
          ? _value.pub
          : pub // ignore: cast_nullable_to_non_nullable
              as String,
      prv: null == prv
          ? _value.prv
          : prv // ignore: cast_nullable_to_non_nullable
              as String,
      pngBase64: null == pngBase64
          ? _value.pngBase64
          : pngBase64 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KID implements _KID {
  const _$_KID({required this.pub, required this.prv, required this.pngBase64});

  factory _$_KID.fromJson(Map<String, dynamic> json) => _$$_KIDFromJson(json);

  @override
  final String pub;
  @override
  final String prv;
  @override
  final String pngBase64;

  @override
  String toString() {
    return 'KID(pub: $pub, prv: $prv, pngBase64: $pngBase64)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KID &&
            (identical(other.pub, pub) || other.pub == pub) &&
            (identical(other.prv, prv) || other.prv == prv) &&
            (identical(other.pngBase64, pngBase64) ||
                other.pngBase64 == pngBase64));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pub, prv, pngBase64);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KIDCopyWith<_$_KID> get copyWith =>
      __$$_KIDCopyWithImpl<_$_KID>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KIDToJson(
      this,
    );
  }
}

abstract class _KID implements KID {
  const factory _KID(
      {required final String pub,
      required final String prv,
      required final String pngBase64}) = _$_KID;

  factory _KID.fromJson(Map<String, dynamic> json) = _$_KID.fromJson;

  @override
  String get pub;
  @override
  String get prv;
  @override
  String get pngBase64;
  @override
  @JsonKey(ignore: true)
  _$$_KIDCopyWith<_$_KID> get copyWith => throw _privateConstructorUsedError;
}
