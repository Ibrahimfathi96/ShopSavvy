import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class RatingData {
  Crud crud;

  RatingData(this.crud);

  getData(String orderId, String rating, String ratingComment) async {
    var response = await crud.postData(AppLink.rating, {
      "orderId": orderId.toString(),
      "rating": rating.toString(),
      "ratingComment": ratingComment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
