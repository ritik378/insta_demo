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
      LanguageString.followings:'Followings',
      LanguageString.smallYou:'you',
      LanguageString.liked:'liked',
      LanguageString.comment:'comment',
      LanguageString.posts:'posts',
      LanguageString.and:'and',
      LanguageString.start:'start',
      LanguageString.following:'following',
      LanguageString.nice:'Nice',
      LanguageString.capitalYou:'You',
      LanguageString.by:'by',
      LanguageString.others:'others',
      LanguageString.tokyo:'Tokyo',
      LanguageString.japan:'Japan',
      LanguageString.followers:'followers',
      LanguageString.editProfile:'Edit Profile',
      LanguageString.loginWithGoogle:'Login with Google',
      LanguageString.newPost:'New Post',
      LanguageString.next:'Next',
      LanguageString.recents:'Recents',
      LanguageString.selectMultiple:'SELECT MULTIPLE',


    },
    'hi_IN': {
      LanguageString.login: 'लॉग इन',
    },
  };
}
