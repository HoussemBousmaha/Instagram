import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_settings.freezed.dart';
part 'post_settings.g.dart';

@immutable
@freezed
class PostSettings with _$PostSettings {
  const factory PostSettings({
    required bool isLikeable,
    required bool isCommentable,
  }) = _PostSettings;

  const PostSettings._();

  factory PostSettings.initial() => const PostSettings(isLikeable: true, isCommentable: true);

  factory PostSettings.fromJson(Map<String, dynamic> json) => _$PostSettingsFromJson(json);
}
