import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart'; 

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn;

  // Constructor with platform-specific configuration
  AuthService()
      : _googleSignIn = GoogleSignIn(
          // Use client ID only for web
          clientId: kIsWeb 
      ? '466345982979-boe3ufvooibgio9o95eubms1mu557htm.apps.googleusercontent.com'
      : null,
  scopes: ['email', 'profile', 'openid'],
);

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      return authResult.user;
    } catch (error) {
      print('Google Sign-In Error: $error');
      rethrow; // Better for error handling in UI
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Check if user is logged in
  bool get isLoggedIn => _auth.currentUser != null;
}