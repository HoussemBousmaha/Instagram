import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/failure_constants.dart';
import '../../../../core/constant/firebase_constants.dart';
import '../../../authentication/domain/entity/auth_exception.dart';
import '../../domain/entity/post_exception.dart';
import '../../presentation/constants/post_constants.dart';
import '../model/create_post_request.dart';
import '../model/delete_post_request.dart';
import '../model/post_model.dart';

@immutable
abstract class PostRemoteDataSource {
  Future<PostModel> createPost(CreatePostRequest request);
  Future<PostModel> deletePost(DeletePostRequest request);
}

@immutable
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  const PostRemoteDataSourceImpl(this._firebaseAuth, this._firebaseFirestore, this._firebaseStorage);

  @override
  Future<PostModel> createPost(CreatePostRequest request) async {
    final userId = _firebaseAuth.currentUser?.uid;

    if (userId == null) {
      throw const AuthException(
        message: FirebaseAuthErrorMessages.userNotFound,
        code: FirebaseAuthErrorCodes.userNotFound,
      );
    }
    try {
      // create post document with auto generated id
      final postsCollection = _firebaseFirestore.collection(FirestoreCollections.posts);
      final postDoc = postsCollection.doc();
      final postId = postDoc.id;

      // 1- Upload image to firebase storage

      final fileId = const Uuid().v4();
      final aspectRatio = request.aspectRatio;
      final description = request.description;
      final settings = request.settings;

      // root storage reference
      final userStorageRef = _firebaseStorage.ref().child(userId);
      // posts storage reference
      final postsStorageRef = userStorageRef.child(FirebaseStorageNodes.posts);

      final postImageRef = postsStorageRef.child(postId);

      // images storage reference
      final imagesRef = postImageRef.child(FirebaseStorageNodes.images);
      // thumbnails storage reference
      final thumbnailsRef = postImageRef.child(FirebaseStorageNodes.thumbnails);

      // image storage reference
      final imageStorageRef = imagesRef.child(fileId);
      // thumbnail storage reference
      final thumbnailStorageRef = thumbnailsRef.child(fileId);

      // upload image to firebase storage
      await imageStorageRef.putFile(request.file);
      // print('image uploaded');
      // upload thumbnail to firebase storage
      await thumbnailStorageRef.putData(request.thumbnail);
      // print('thumbnail uploaded');

      // get image url
      final fileUrl = await imageStorageRef.getDownloadURL();
      // print('image url: $imageUrl');
      // get thumbnail url
      final thumbnailUrl = await thumbnailStorageRef.getDownloadURL();
      // print('thumbnail url: $thumbnailUrl');

      // 2- put post document data in firestore

      final postDocData = {
        PostJsonKeys.id: postId,
        PostJsonKeys.userId: userId,
        PostJsonKeys.fileUrl: fileUrl,
        PostJsonKeys.fileId: fileId,
        PostJsonKeys.type: request.type.name,
        PostJsonKeys.thumbnailUrl: thumbnailUrl,
        PostJsonKeys.thumbnailId: fileId,
        PostJsonKeys.description: description,
        PostJsonKeys.aspectRatio: aspectRatio,
        PostJsonKeys.settings: settings.toJson(),
        PostJsonKeys.createdAt: FieldValue.serverTimestamp(),
      };

      // put post document data in firestore
      await postDoc.set(postDocData);

      // get post document from firestore with timestamp converted to date
      final postedDoc = await postDoc.get();
      final postedDocData = postedDoc.data();

      if (postedDocData == null) {
        throw const PostException(
          message: PostsFailureMessages.postNotFound,
          code: PostsFailureCodes.postNotFound,
        );
      }

      final postModel = PostModel.fromJson(postedDocData);

      return postModel;
    } on AuthException catch (authErr) {
      final message = authErr.message;
      final code = authErr.code;
      throw PostException(message: message, code: code);
    } on FirebaseException catch (firebaseErr) {
      final message = firebaseErr.message ?? PostsFailureMessages.postNotCreated;
      final code = firebaseErr.code;
      throw PostException(message: message, code: code);
    } catch (_) {
      const message = PostsFailureMessages.postNotCreated;
      const code = PostsFailureCodes.postNotCreated;
      throw const PostException(message: message, code: code);
    }
  }

  @override
  Future<PostModel> deletePost(DeletePostRequest request) async {
    try {
      final post = request.post;
      final imageId = post.fileId;
      final thumbnailId = post.thumbnailId;
      final userId = post.userId;

      // root storage reference
      final userStorageRef = _firebaseStorage.ref().child(userId);

      // posts storage reference
      final postsStorageRef = userStorageRef.child(FirebaseStorageNodes.posts);
      // post storage reference
      final postImageRef = postsStorageRef.child(post.id);

      // images storage reference
      final imagesRef = postImageRef.child(FirebaseStorageNodes.images);
      // thumbnails storage reference
      final thumbnailsRef = postImageRef.child(FirebaseStorageNodes.thumbnails);

      // image storage reference
      final imageStorageRef = imagesRef.child(imageId);
      // thumbnail storage reference
      final thumbnailStorageRef = thumbnailsRef.child(thumbnailId);

      await imageStorageRef.delete();

      await thumbnailStorageRef.delete();

      // 2- delete post from firestore

      final postsCollection = _firebaseFirestore.collection(FirestoreCollections.posts);
      final postDocRef = postsCollection.doc(post.id);
      final postDoc = await postDocRef.get();
      final postDocData = postDoc.data();

      if (postDocData == null) {
        throw const PostException(
          message: PostsFailureMessages.postNotFound,
          code: PostsFailureCodes.postNotFound,
        );
      }

      await postDocRef.delete();

      // 3- return deleted post
      final postModel = PostModel.fromJson(postDocData);
      return postModel;
    } on AuthException catch (authErr) {
      final message = authErr.message;
      final code = authErr.code;
      throw PostException(message: message, code: code);
    } on FirebaseException catch (firebaseErr) {
      final message = firebaseErr.message ?? PostsFailureMessages.postNotDeleted;
      final code = firebaseErr.code;
      throw PostException(message: message, code: code);
    } catch (_) {
      const message = PostsFailureMessages.postNotDeleted;
      const code = PostsFailureCodes.postNotDeleted;
      throw const PostException(message: message, code: code);
    }
  }
}
