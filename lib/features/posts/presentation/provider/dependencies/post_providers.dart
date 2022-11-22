import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/constant/firebase_constants.dart';
import '../../../../../core/dependencies/app_dependecies.dart';
import '../../../../authentication/presentation/provider/dependencies/auth_providers.dart';
import '../../../data/model/post_model.dart';
import '../../../domain/entity/post.dart';
import '../../constants/post_constants.dart';

final postsStreamProvider = StreamProvider.autoDispose<Iterable<PostEntity>>((ref) {
  final db = ref.watch(dbProvider);
  final authenticated = ref.watch(authenticatedProvider);

  if (authenticated == false) return const Stream.empty();

  // posts collection
  final postsCollection = db.collection(FirestoreCollections.posts);

  // posts query to order by datetime
  final postsQuery = postsCollection.orderBy(PostJsonKeys.createdAt, descending: true);

  final stream = postsQuery.snapshots().map(
        (snapshot) => snapshot.docs
            // this where is for filtering the created at field which is not yet created
            .where((doc) => !doc.metadata.hasPendingWrites)
            // this map is for converting the snapshot to post entity
            .map((doc) => PostEntity.fromPostModel(PostModel.fromJson(doc.data()))),
      );

  return stream;
});
