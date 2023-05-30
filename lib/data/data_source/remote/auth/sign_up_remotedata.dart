import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postData(String userName, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signup, {
      "username":userName,
      "password":password,
      "email":email,
      "phone":phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}