import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class CartViewData {
  Crud crud;

  CartViewData(this.crud);

  getData(String userId) async {
    var response = await crud
        .postData(AppLink.cartView, {"userId": userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}