import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthService = Provider((ref) {
  final authInstance = FirebaseAuth.instance;
  const useEmulator = bool.fromEnvironment('USE_EMULATOR', defaultValue: false);
  if (kIsWeb) authInstance.setPersistence(Persistence.LOCAL);
  if (useEmulator) {
    authInstance.useAuthEmulator('localhost', 9099);
  }
  return FirebaseAuthService(authInstance: authInstance);
});

class FirebaseAuthService {
  @protected
  final FirebaseAuth authInstance;

  FirebaseAuthService({required this.authInstance});

  Future<User?> signInAnonymously() async {
    final userCredential = await authInstance.signInAnonymously();
    return userCredential.user;
  }
}
