import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class EditLocationData {
  Crud crud;

  EditLocationData(this.crud);

  getData(
      String userId,
      String name,
      String locationId,
      String city,
      String street,
      String lat,
      String lng,
      ) async {
    var response = await crud.postData(AppLink.editLocation, {
      "userId": userId,
      "name": name,
      "location_id": locationId,
      "city": city,
      "street": street,
      "lat": lat,
      "long": lng,
    });
    return response.fold((l) => l, (r) => r);
  }
}
