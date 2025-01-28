import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_configs_model.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class UserConfigsModel with _$UserConfigsModel {
  const factory UserConfigsModel({
    @Default(true) bool isFirstTime,
  }) = _UserConfigsModel;

  const UserConfigsModel._();

  factory UserConfigsModel.fromJson(Map<String, dynamic> json) {
    return UserConfigsModel(
      isFirstTime: json[isFirstTimeKey] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      isFirstTimeKey: isFirstTime,
    };
  }

  static const isFirstTimeKey = 'isFirstTime';
}
