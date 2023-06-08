class AppLink {
  //emulatorServer
  // static const String server = "http://10.0.2.2/shop_savvy";
  //phoneServer
  static const String server = "http://192.168.1.8/shop_savvy";

  // static const String server = "http://192.168.1.1/shop_savvy";
  static const String test = "$server/test.php";

  //AUTH
  static const String signup = "$server/auth/sign_up.php";
  static const String signIn = "$server/auth/sign_in.php";
  static const String signupVerifyCode = "$server/auth/verify_code.php";

  //ForgetPassword
  static const String checkEmail = "$server/forget_password/check_email.php";
  static const String checkPhone =
      "$server/forget_password/check_phone_number.php";
  static const String resetPassword =
      "$server/forget_password/reset_password.php";
  static const String fpVerifyCode = "$server/forget_password/verify_code.php";
}
