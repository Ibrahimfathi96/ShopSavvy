import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class SignInData {
  Crud crud;

  SignInData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.signIn, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
