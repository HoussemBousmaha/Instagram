import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network/network_info.dart';

part 'app_dependecies.g.dart';

@riverpod
NetworkInfo networkInfo(NetworkInfoRef ref) {
  return const NetworkInfoImpl();
}

@riverpod
FirebaseAuth auth(AuthRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
FirebaseFirestore db(DbRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
FirebaseStorage storage(StorageRef ref) {
  return FirebaseStorage.instance;
}

@riverpod
GoogleSignIn googleAuth(GoogleAuthRef ref) {
  return GoogleSignIn(scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);
}

@riverpod
ImagePicker imagePicker(ImagePickerRef ref) {
  return ImagePicker();
}
