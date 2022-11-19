import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/constant/firebase_constants.dart';
import '../../domain/entity/auth_exception.dart';
import '../../domain/entity/auth_user.dart';
import '../model/auth_request.dart';

@immutable
abstract class AuthRemoteDataSource {
  // User is the user model provided by firebase_auth
  Future<User> signUpWithEmailAndPassword(AuthRequest request);
  Future<User> signInWithEmailAndPassword(AuthRequest request);
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<void> signOut();
  Future<void> saveUserInfoToDatabase(AuthUser user);
  Future<User?> get currentUser;
}

@immutable
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final GoogleSignIn _googleSignIn;

  const AuthRemoteDataSourceImpl(this._firebaseAuth, this._firebaseFirestore, this._googleSignIn);

  @override
  Future<User> signUpWithEmailAndPassword(AuthRequest request) async {
    try {
      final authCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      final firebaseUser = authCredential.user;

      if (firebaseUser == null) {
        throw FirebaseAuthException(
          message: FirebaseAuthErrorMessages.userNotFound,
          code: FirebaseAuthErrorCodes.userNotFound,
        );
      }

      return firebaseUser;
    } on FirebaseAuthException catch (authErr) {
      final message = authErr.message ?? FirebaseAuthErrorMessages.operationNotAllowed;
      final code = authErr.code;
      throw AuthException(message: message, code: code);
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(AuthRequest request) async {
    try {
      final authCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      final firebaseUser = authCredential.user;

      if (firebaseUser == null) {
        throw FirebaseAuthException(
          message: FirebaseAuthErrorMessages.userNotFound,
          code: FirebaseAuthErrorCodes.userNotFound,
        );
      }

      return firebaseUser;
    } on FirebaseAuthException catch (authErr) {
      final message = authErr.message ?? FirebaseAuthErrorMessages.operationNotAllowed;
      final code = authErr.code;
      throw AuthException(message: message, code: code);
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();

      final googleAuth = await googleSignInAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final authCredential = await _firebaseAuth.signInWithCredential(credential);

      final firebaseUser = authCredential.user;

      if (firebaseUser == null) {
        throw FirebaseAuthException(
          message: FirebaseAuthErrorMessages.userNotFound,
          code: FirebaseAuthErrorCodes.userNotFound,
        );
      }

      return firebaseUser;
    } on FirebaseAuthException catch (authErr) {
      final message = authErr.message ?? FirebaseAuthErrorMessages.operationNotAllowed;
      final code = authErr.code;
      throw AuthException(message: message, code: code);
    }
  }

  @override
  Future<User> signInWithFacebook() async {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (err) {
      final message = err.message ?? FirebaseAuthErrorMessages.operationNotAllowed;
      final code = err.code;
      throw AuthException(message: message, code: code);
    }
  }

  @override
  Future<void> saveUserInfoToDatabase(AuthUser user) async {
    try {
      final usersCollection = _firebaseFirestore.collection(FirestoreCollections.users);

      final userDocument = usersCollection.doc(user.id);

      final userJson = user.toJson();

      await userDocument.set(userJson);
    } on FirebaseException catch (err) {
      final message = err.message ?? FirebaseAuthErrorMessages.operationNotAllowed;
      final code = err.code;
      throw AuthException(message: message, code: code);
    }
  }

  @override
  Future<User?> get currentUser async {
    try {
      final currentUser = _firebaseAuth.currentUser;

      return currentUser;
    } on FirebaseAuthException catch (err) {
      final message = err.message ?? FirebaseAuthErrorMessages.operationNotAllowed;
      final code = err.code;
      throw AuthException(message: message, code: code);
    }
  }
}
