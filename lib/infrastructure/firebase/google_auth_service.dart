import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  bool _initialized = false;

  Future<void> _init() async {
    if (!_initialized) {
      await _googleSignIn.initialize(
        serverClientId:
            '287578845685-30ah3ot2lu8n9im6rf038bg7vsp3b96a.apps.googleusercontent.com',
      );
    }
    _initialized = true;
  }

  Future<User?> signInWithGoogle() async {
    try {
      _init();

      final googleUser = await _googleSignIn.authenticate();

      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      debugPrint("Sign-in error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();

    await _auth.signOut();
  }
}
