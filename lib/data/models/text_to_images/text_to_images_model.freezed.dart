// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_to_images_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextToImagesModel {
  String get deviceId => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;

  /// Create a copy of TextToImagesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextToImagesModelCopyWith<TextToImagesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextToImagesModelCopyWith<$Res> {
  factory $TextToImagesModelCopyWith(
          TextToImagesModel value, $Res Function(TextToImagesModel) then) =
      _$TextToImagesModelCopyWithImpl<$Res, TextToImagesModel>;
  @useResult
  $Res call({String deviceId, String prompt, String image, bool isPublic});
}

/// @nodoc
class _$TextToImagesModelCopyWithImpl<$Res, $Val extends TextToImagesModel>
    implements $TextToImagesModelCopyWith<$Res> {
  _$TextToImagesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextToImagesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? prompt = null,
    Object? image = null,
    Object? isPublic = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextToImagesModelImplCopyWith<$Res>
    implements $TextToImagesModelCopyWith<$Res> {
  factory _$$TextToImagesModelImplCopyWith(_$TextToImagesModelImpl value,
          $Res Function(_$TextToImagesModelImpl) then) =
      __$$TextToImagesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId, String prompt, String image, bool isPublic});
}

/// @nodoc
class __$$TextToImagesModelImplCopyWithImpl<$Res>
    extends _$TextToImagesModelCopyWithImpl<$Res, _$TextToImagesModelImpl>
    implements _$$TextToImagesModelImplCopyWith<$Res> {
  __$$TextToImagesModelImplCopyWithImpl(_$TextToImagesModelImpl _value,
      $Res Function(_$TextToImagesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextToImagesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? prompt = null,
    Object? image = null,
    Object? isPublic = null,
  }) {
    return _then(_$TextToImagesModelImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TextToImagesModelImpl extends _TextToImagesModel {
  const _$TextToImagesModelImpl(
      {required this.deviceId,
      required this.prompt,
      required this.image,
      required this.isPublic})
      : super._();

  @override
  final String deviceId;
  @override
  final String prompt;
  @override
  final String image;
  @override
  final bool isPublic;

  @override
  String toString() {
    return 'TextToImagesModel(deviceId: $deviceId, prompt: $prompt, image: $image, isPublic: $isPublic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextToImagesModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, deviceId, prompt, image, isPublic);

  /// Create a copy of TextToImagesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextToImagesModelImplCopyWith<_$TextToImagesModelImpl> get copyWith =>
      __$$TextToImagesModelImplCopyWithImpl<_$TextToImagesModelImpl>(
          this, _$identity);
}

abstract class _TextToImagesModel extends TextToImagesModel {
  const factory _TextToImagesModel(
      {required final String deviceId,
      required final String prompt,
      required final String image,
      required final bool isPublic}) = _$TextToImagesModelImpl;
  const _TextToImagesModel._() : super._();

  @override
  String get deviceId;
  @override
  String get prompt;
  @override
  String get image;
  @override
  bool get isPublic;

  /// Create a copy of TextToImagesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextToImagesModelImplCopyWith<_$TextToImagesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
