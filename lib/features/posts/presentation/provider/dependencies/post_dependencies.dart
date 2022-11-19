import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/dependencies/app_dependecies.dart';
import '../../../data/datasource/post_remote_datasource.dart';
import '../../../data/repository/post_repo_impl.dart';
import '../../../domain/repository/post_repo.dart';
import '../../../domain/usecase/create_post_usecase.dart';
import '../../../domain/usecase/delete_post_usecase.dart';

final postRemoteDataSourceProvider = Provider<PostRemoteDataSource>((ref) {
  final firebaseAuth = ref.refresh(firebaseAuthProvider);
  final firebaseFirestore = ref.refresh(firebaseFirestoreProvider);
  final firebaseStorage = ref.refresh(firebaseStorageProvider);
  return PostRemoteDataSourceImpl(firebaseAuth, firebaseFirestore, firebaseStorage);
});

final postRepoProvider = Provider<PostRepo>((ref) {
  final postRemoteDataSource = ref.refresh(postRemoteDataSourceProvider);
  final networkInfo = ref.refresh(networkInfoProvider);
  return PostRepoImpl(postRemoteDataSource, networkInfo);
});

final createPostUseCaseProvider = Provider<CreatePostUseCase>((ref) {
  final postRepo = ref.refresh(postRepoProvider);
  return CreatePostUseCase(postRepo);
});

final deletePostUseCaseProvider = Provider<DeletePostUseCase>((ref) {
  final postRepo = ref.refresh(postRepoProvider);
  return DeletePostUseCase(postRepo);
});
