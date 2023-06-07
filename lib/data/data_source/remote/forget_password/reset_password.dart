import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class ResetPasswordData{
  Crud crud;

  ResetPasswordData(this.crud);

  postData(String email, String password)async{
    var response = await crud.postData(AppLink.resetPassword, {
      "password":password,
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}