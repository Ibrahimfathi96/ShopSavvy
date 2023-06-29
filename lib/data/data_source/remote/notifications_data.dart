import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class NotificationsData {
  Crud crud;

  NotificationsData(this.crud);

  getData(String userId) async {
    var response = await crud
        .postData(AppLink.notifications, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }
}
