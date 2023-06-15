import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class RemoveFromFavorite {
  Crud crud;

  RemoveFromFavorite(this.crud);

  getData(String userId, String itemsId) async {
    var response = await crud
        .postData(AppLink.removeFromFavorite, {"usersId": userId, "itemsId": itemsId});
    return response.fold((l) => l, (r) => r);
  }
}
