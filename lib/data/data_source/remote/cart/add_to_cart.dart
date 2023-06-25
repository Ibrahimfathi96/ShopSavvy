import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class AddToCartData {
  Crud crud;

  AddToCartData(this.crud);

  getData(String userId, String itemsId) async {
    var response = await crud.postData(AppLink.addToCart,
        {"itemsId": itemsId.toString(), "usersId": userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
