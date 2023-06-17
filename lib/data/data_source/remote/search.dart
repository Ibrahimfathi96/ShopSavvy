import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class SearchItemsData {
  Crud crud;

  SearchItemsData(this.crud);

  getData(String search) async {
    var response = await crud
        .postData(AppLink.searchItems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
