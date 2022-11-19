import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/constant/enum.dart';
import '../../../../../core/constant/firebase_constants.dart';
import '../../../../../core/dependencies/app_dependecies.dart';
import '../../../../authentication/presentation/provider/dependencies/auth_providers.dart';
import '../../../data/model/post_model.dart';
import '../../../domain/entity/post.dart';
import '../../../domain/entity/post_failure.dart';
import '../../constants/post_constants.dart';
import '../notifier/post_notifier_provider.dart';

final postsStreamProvider = StreamProvider.autoDispose<Iterable<PostEntity>>((ref) {
  final firebaseFirestore = ref.watch(firebaseFirestoreProvider);
  final authenticated = ref.watch(authenticatedProvider);

  if (authenticated == false) return const Stream.empty();

  final controller = StreamController<Iterable<PostEntity>>();

  // posts collection
  final postsCollection = firebaseFirestore.collection(FirestoreCollections.posts);
  // posts query to order by datetime
  final postsQuery = postsCollection.orderBy(PostJsonKeys.createdAt, descending: true);

  final stream = postsQuery.snapshots().map(
        (snapshot) => snapshot.docs
            // this where is for filtering the created at field which is not yet created
            .where((doc) => !doc.metadata.hasPendingWrites)
            // this map is for converting the snapshot to post entity
            .map((doc) => PostEntity.fromPostModel(PostModel.fromJson(doc.data()))),
      );

  final sub = stream.listen((postsEntities) {
    controller.sink.add(postsEntities);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});

final postFailureProvider = Provider<PostFailure?>((ref) {
  final postState = ref.watch(postNotifierProvider);
  final failure = postState.value?.failure;

  return failure;
});

final isPostOperationSuccessProvider = Provider<bool>((ref) {
  final viewState = ref.watch(postNotifierProvider.select((state) => state.value?.viewState));

  return viewState == ViewState.success;
});
