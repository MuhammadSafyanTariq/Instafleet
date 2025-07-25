import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Email/password sign up
  Future<User?> signUp({
    required String email,
    required String password,
    required String phone,
  }) async {
    final UserCredential cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Optionally, you can store the phone in Firestore or as a user property
    // For now, just return the user
    return cred.user;
  }

  // Email/password sign in
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    final UserCredential cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  // Google sign in
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  // Apple sign in
  Future<User?> signInWithApple() async {
    if (!Platform.isIOS && !kIsWeb) {
      throw Exception('Apple Sign-In only available on iOS or Web');
    }
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName
      ],
    );
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
    final userCredential = await _auth.signInWithCredential(oauthCredential);
    return userCredential.user;
  }
}
