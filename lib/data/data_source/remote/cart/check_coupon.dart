import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class CheckCouponData {
  Crud crud;

  CheckCouponData(this.crud);

  getData(String couponName) async {
    var response = await crud
        .postData(AppLink.checkCoupon, {"couponName": couponName});
    return response.fold((l) => l, (r) => r);
  }
}