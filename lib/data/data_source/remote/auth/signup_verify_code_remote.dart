import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.signupVerifyCode, {
      "email":email,
      "verifycode":verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}