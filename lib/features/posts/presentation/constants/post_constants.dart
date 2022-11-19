import 'package:flutter/material.dart';

@immutable
class PostJsonKeys {
  static const id = 'id';
  static const userId = 'user_id';
  static const fileUrl = 'file_url';
  static const fileId = 'file_id';
  static const type = 'type';
  static const thumbnailUrl = 'thumbnail_url';
  static const thumbnailId = 'thumbnail_id';
  static const description = 'description';
  static const createdAt = 'created_at';
  static const aspectRatio = 'aspect_ratio';
  static const settings = 'settings';

  const PostJsonKeys._();
}

@immutable
class PostSettingsJsonKeys {
  static const isCommentable = 'is_commentable';
  static const isLikeable = 'is_likeable';

  const PostSettingsJsonKeys._();
}

@immutable
class PostConstants {
  static const thumbnailSize = 200;

  const PostConstants._();
}
