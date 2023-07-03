import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class OffersData {
  Crud crud;

  OffersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
