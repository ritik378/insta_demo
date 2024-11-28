import 'package:get/get.dart';
import 'package:insta_demo/common/language/language_string.dart';

class TranslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => translations;

  final Map<String, Map<String, String>> translations = {
    'en_US': {
      LanguageString.login: 'Login',
      LanguageString.phoneEmailUserName:'Phone number, email or username',
      LanguageString.password:'Password',
      LanguageString.forgotPassword:'Forgot Password?',
      LanguageString.loginWithFb:'Login with Facebook',
      LanguageString.or:'OR',
      LanguageString.dontHaveAnAccount:'Don\'t have an account? ',
      LanguageString.signUp:'Sign Up',
      LanguageString.following:'Following',
      LanguageString.you:'You',
    },
    'hi_IN': {
      LanguageString.login: 'लॉग इन',
    },
  };
}
