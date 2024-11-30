class CommonLogics{


  static accountValidation(String? value){
    if(value==null|| value.isEmpty){
      return 'Enter phone, email or username';
    }
    return null;
  }

  static passwordValidation(String? value){
    if(value==null|| value.isEmpty){
      return 'Enter password';
    }
    return null;
  }
}