import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/post_model.dart';
import '../../presentation/constants/enums.dart';
import 'post_settings.dart';

part 'post.freezed.dart';

@immutable
@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    required String id,
    required String userId,
    required String fileUrl,
    required String fileId,
    required FileType type,
    required String thumbnailUrl,
    required String thumbnailId,
    required String description,
    required double aspectRatio,
    required PostSettings settings,
    required DateTime createdAt,
  }) = _PostEntity;

  factory PostEntity.fromPostModel(PostModel postModel) {
    return PostEntity(
      id: postModel.id!,
      userId: postModel.userId!,
      fileUrl: postModel.fileUrl!,
      fileId: postModel.fileId!,
      type: postModel.type!,
      thumbnailUrl: postModel.thumbnailUrl!,
      thumbnailId: postModel.thumbnailId!,
      description: postModel.description!,
      aspectRatio: postModel.aspectRatio!,
      settings: postModel.settings!,
      createdAt: postModel.createdAt!,
    );
  }
}
