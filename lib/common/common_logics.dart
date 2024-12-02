class CommonLogics{


  static String? accountValidation(String? value){
    if(value==null|| value.isEmpty){
      return 'Enter phone, email or username';
    }
    return null;
  }

  static String? passwordValidation(String? value){
    if(value==null|| value.isEmpty){
      return 'Enter password';
    }
    return null;
  }
}