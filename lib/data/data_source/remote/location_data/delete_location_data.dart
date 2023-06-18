import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class DeleteLocationData {
  Crud crud;

  DeleteLocationData(this.crud);

  getData(String locationId) async {
    var response = await crud.postData(AppLink.deleteLocation, {
      "locationId": locationId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
