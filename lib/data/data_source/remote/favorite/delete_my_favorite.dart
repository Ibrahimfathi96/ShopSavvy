import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class DeleteFromFavoriteData {
  Crud crud;

  DeleteFromFavoriteData(this.crud);

  getData(String favId) async {
    var response =
        await crud.postData(AppLink.deleteFromMyFavorite, {"id": favId});
    return response.fold((l) => l, (r) => r);
  }
}
