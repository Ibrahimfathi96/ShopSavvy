import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class PendingOrdersData {
  Crud crud;

  PendingOrdersData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLink.pendingOrders, {
      "userId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
