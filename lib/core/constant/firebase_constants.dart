import 'package:flutter/material.dart';

@immutable
class FirebasePlugins {
  static const String firebaseCore = 'firebase_core';
  static const String firebaseAuth = 'firebase_auth';
  static const String firebaseFirestore = 'cloud_firestore';

  const FirebasePlugins._();
}

@immutable
class FirestoreCollections {
  static const String users = 'users';
  static const String posts = 'posts';

  const FirestoreCollections._();
}

@immutable
class FirebaseAuthErrorMessages {
  static const String userNotFound = 'user not found';
  static const String wrongPassword = 'wrong password';
  static const String tooManyRequests = 'too many requests';
  static const String operationNotAllowed = 'operation not allowed';
  static const String emailAlreadyInUse = 'email already in use';
  static const String invalidEmail = 'invalid email';
  static const String weakPassword = 'weak password';

  const FirebaseAuthErrorMessages._();
}

@immutable
class FirebaseAuthErrorCodes {
  static const String userNotFound = 'user-not-found';
  static const String wrongPassword = 'wrong-password';
  static const String tooManyRequests = 'too-many-requests';
  static const String operationNotAllowed = 'operation-not-allowed';
  static const String emailAlreadyInUse = 'email-already-in-use';
  static const String invalidEmail = 'invalid-email';
  static const String weakPassword = 'weak-password';

  const FirebaseAuthErrorCodes._();
}

@immutable
class FirebaseStorageNodes {
  static const String images = 'images';
  static const String thumbnails = 'thumbnails';
  static const String posts = 'posts';

  const FirebaseStorageNodes._();
}
