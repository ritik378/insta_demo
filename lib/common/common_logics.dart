class CommonLogics{
  static fieldValidation(String? value){
    if(value==null|| value.isEmpty){
      return 'enter value';
    }
    return null;
  }
}