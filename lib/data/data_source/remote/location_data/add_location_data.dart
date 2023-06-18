import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class AddLocationData {
  Crud crud;

  AddLocationData(this.crud);

  getData(
    String userId,
    String name,
    String city,
    String street,
    String lat,
    String lng,
  ) async {
    var response = await crud.postData(AppLink.addLocation, {
      "userId": userId,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": lng,
    });
    return response.fold((l) => l, (r) => r);
  }
}
