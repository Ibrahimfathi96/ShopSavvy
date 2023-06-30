import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  getData(String orderId) async {
    var response = await crud.postData(AppLink.ordersDetails, {
      "orderId": orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
