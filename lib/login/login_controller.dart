import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Controller for managing login-related logic.
class LoginController extends GetxController {
  /// Key for the login form.
  final formKey = GlobalKey<FormState>();

  /// Instance of GoogleSignIn for handling Google sign-in.
  final googleSignIn = GoogleSignIn();

  /// Observable boolean to track Google sign-in status.
  var isGoogleSignIn = false.obs;

  /// Signs in the user with Google.
  Future<void> signInWithGoogle() async {
    isGoogleSignIn.value = true;
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        debugPrint("User Name: ${googleUser.displayName}");
        debugPrint("User Email: ${googleUser.email}");
        debugPrint("Photo Url: ${googleUser.photoUrl}");
      }
    } catch (error) {
      debugPrint("Google Sign-In Error: $error");
    }
    isGoogleSignIn.value = false;
  }

  /// Signs out the user from Google.
    Future<void> signOut() async {
    await googleSignIn.signOut();
    debugPrint("User signed out");
  }
}