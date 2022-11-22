import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/dependencies/app_dependecies.dart';
import '../../../data/datasource/post_remote_datasource.dart';
import '../../../data/repository/post_repo_impl.dart';
import '../../../domain/repository/post_repo.dart';
import '../../../domain/usecase/create_post_usecase.dart';
import '../../../domain/usecase/delete_post_usecase.dart';

part 'post_dependencies.g.dart';

@riverpod
PostRemoteDataSource postRemoteDataSource(PostRemoteDataSourceRef ref) {
  final firebaseAuth = ref.watch(authProvider);
  final firebaseFirestore = ref.watch(dbProvider);
  final firebaseStorage = ref.watch(storageProvider);

  return PostRemoteDataSourceImpl(firebaseAuth, firebaseFirestore, firebaseStorage);
}

@riverpod
PostRepo postRepo(PostRepoRef ref) {
  final postRemoteDataSource = ref.watch(postRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return PostRepoImpl(postRemoteDataSource, networkInfo);
}

@riverpod
CreatePostUseCase createPostUseCase(CreatePostUseCaseRef ref) {
  final postRepo = ref.watch(postRepoProvider);
  return CreatePostUseCase(postRepo);
}

@riverpod
DeletePostUseCase deletePostUseCase(DeletePostUseCaseRef ref) {
  final postRepo = ref.watch(postRepoProvider);
  return DeletePostUseCase(postRepo);
}
