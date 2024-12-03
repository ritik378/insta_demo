import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insta_demo/common/app_keys.dart';
import 'package:insta_demo/common/common_logics/common_logics_controller.dart';

/// Controller for managing login-related logic.
class LoginController extends GetxController {
  var accountController = TextEditingController();
  var passwordController = TextEditingController();
  var acFieldError = Rxn<String>();
  var passwordFieldError = Rxn<String>();
  CommonLogicsController commonLogicsController = Get.find();

  @override
  void onInit() {
    super.onInit();
    commonLogicsController.isDarkMode.value =
        GetStorage().read(AppKeys.isDarkMode) ?? false;
  }

  /// Validation logic for the Account field
  bool validateAcField(String value) {
    if (value.isEmpty) {
      acFieldError.value = 'Enter email, username, phone';
      return false;
    } else {
      acFieldError.value = null;
      return true;
    }
  }

  /// Validation logic for the password field
  bool validatePasswordField(String value) {
    if (value.isEmpty) {
      passwordFieldError.value = 'Enter password';
      return false;
    } else {
      passwordFieldError.value = null;
      return true;
    }
  }

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
