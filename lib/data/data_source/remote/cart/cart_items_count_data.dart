import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class CartItemsCount {
  Crud crud;

  CartItemsCount(this.crud);

  getData(String userId, String itemsId) async {
    var response = await crud
        .postData(AppLink.cartItemsCount, {"itemsId": itemsId.toString(), "usersId": userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}