import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class AddToFavorite {
  Crud crud;

  AddToFavorite(this.crud);

  getData(String userId, String itemsId) async {
    var response = await crud
        .postData(AppLink.addToFavorite, {"itemsId": itemsId, "usersId": userId});
    return response.fold((l) => l, (r) => r);
  }
}
