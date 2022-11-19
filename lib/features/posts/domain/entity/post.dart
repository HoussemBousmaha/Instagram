import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/model/post_model.dart';
import '../../presentation/constants/enums.dart';

@immutable
class PostEntity extends Equatable {
  final String id;
  final String userId;
  final String fileUrl;
  final String fileId;
  final FileType type;
  final String thumbnailUrl;
  final String thumbnailId;
  final String description;
  final double aspectRatio;
  final DateTime createdAt;

  const PostEntity({
    required this.id,
    required this.userId,
    required this.fileUrl,
    required this.fileId,
    required this.type,
    required this.thumbnailUrl,
    required this.thumbnailId,
    required this.description,
    required this.aspectRatio,
    required this.createdAt,
  });

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
      createdAt: postModel.createdAt!,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        fileUrl,
        fileId,
        type,
        thumbnailUrl,
        thumbnailId,
        description,
        aspectRatio,
        createdAt,
      ];

  @override
  bool get stringify => true;
}
