import 'package:flutter/material.dart';

@immutable
class FailureMessages {
  static const String serverFailure = 'Server Error';
  static const String cacheFailure = 'Cache Error';
  static const String networkFailure = 'Network Error';
  static const String unknownFailure = 'Unknown Error';
  static const String noInternetConnectionFailure = 'No Internet Connection Error';

  const FailureMessages._();
}

@immutable
class FailureCodes {
  static const String serverFailure = 'server_failure';
  static const String cacheFailure = 'cache_failure';
  static const String networkFailure = 'network_failure';
  static const String unknownFailure = 'unknown_failure';
  static const String noInternetConnectionFailure = 'no_internet_connection_failure';

  const FailureCodes._();
}

@immutable
class PostsFailureMessages {
  static const String postNotFound = 'Post not found';
  static const String postAlreadyExists = 'Post already exists';
  static const String postNotCreated = 'Post not created';
  static const String postNotDeleted = 'Post not deleted';
  static const String postsNotFetched = 'Posts not fetched';

  const PostsFailureMessages._();
}

@immutable
class PostsFailureCodes {
  static const String postNotFound = 'post_not_found';
  static const String postAlreadyExists = 'post_already_exists';
  static const String postNotCreated = 'post_not_created';
  static const String postNotDeleted = 'post_not_deleted';
  static const String postsNotFetched = 'posts_not_fetched';

  const PostsFailureCodes._();
}
