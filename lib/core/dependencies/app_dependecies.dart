import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../network/network_info.dart';

final networkInfoProvider = Provider<NetworkInfo>(
  (ref) => const NetworkInfoImpl(),
);

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final firebaseFirestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final firebaseStorageProvider = Provider<FirebaseStorage>(
  (ref) => FirebaseStorage.instance,
);

final googleSignInProvider = Provider<GoogleSignIn>(
  (ref) => GoogleSignIn(scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']),
);

final imagePickerProvider = Provider<ImagePicker>(
  (ref) => ImagePicker(),
);
