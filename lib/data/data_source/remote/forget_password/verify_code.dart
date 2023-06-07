import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class VerifyCodeForgetPasswordData{
  Crud crud;

  VerifyCodeForgetPasswordData(this.crud);

  postData(String email, String verifyCode)async{
    var response = await crud.postData(AppLink.verifyCode, {
      "verifyCode":verifyCode,
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}