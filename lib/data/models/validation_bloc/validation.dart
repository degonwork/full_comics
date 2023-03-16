class Validation{
  static bool isUserName(String? userName){
    return userName!.length > 6;
  }
  static bool isValidEmail(String email){
    return email.length > 6 && email.contains('@');
  }
  static bool isValidPassword(String password){
    return password.length >= 6;
  }
  static bool isConfirmPassword(String? confirmPassword){
    return confirmPassword!.length >= 6;
  }
}