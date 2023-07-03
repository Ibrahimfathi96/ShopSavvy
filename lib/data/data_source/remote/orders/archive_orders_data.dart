import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class ArchiveOrdersData {
  Crud crud;

  ArchiveOrdersData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLink.archiveOrders, {
      "userId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
