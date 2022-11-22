import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/post_settings.dart';
import '../../presentation/constants/enums.dart';
import '../../presentation/constants/post_constants.dart';

part "post_model.freezed.dart";

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    String? id,
    String? userId,
    String? fileUrl,
    String? fileId,
    FileType? type,
    String? thumbnailUrl,
    String? thumbnailId,
    String? description,
    double? aspectRatio,
    PostSettings? settings,
    DateTime? createdAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json[PostJsonKeys.id],
      userId: json[PostJsonKeys.userId],
      fileUrl: json[PostJsonKeys.fileUrl],
      fileId: json[PostJsonKeys.fileId],
      type: fileType(json[PostJsonKeys.type]),
      thumbnailUrl: json[PostJsonKeys.thumbnailUrl],
      thumbnailId: json[PostJsonKeys.thumbnailId],
      description: json[PostJsonKeys.description],
      aspectRatio: json[PostJsonKeys.aspectRatio],
      settings: PostSettings.fromJson(json[PostJsonKeys.settings]),
      createdAt: (json[PostJsonKeys.createdAt] as Timestamp).toDate(),
    );
  }
}

FileType fileType(String type) {
  return type == FileType.image.name ? FileType.image : FileType.video;
}
