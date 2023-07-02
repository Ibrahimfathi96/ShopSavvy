import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class DeleteOrderData {
  Crud crud;

  DeleteOrderData(this.crud);

  getData(String orderId) async {
    var response = await crud.postData(AppLink.deleteOrder, {
      "orderId": orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}