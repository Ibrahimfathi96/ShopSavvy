import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class CheckEmailForgetPasswordData{
  Crud crud;

  CheckEmailForgetPasswordData(this.crud);

  postData(String email)async{
    var response = await crud.postData(AppLink.checkEmail, {
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}