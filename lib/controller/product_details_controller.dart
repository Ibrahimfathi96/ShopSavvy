import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/view/screen/items_view/items_view.dart';

abstract class ProductDetailsController extends GetxController{
  initialData();
  goBack();
}
class ProductDetailsControllerImp extends ProductDetailsController{
  late ItemsMd itemsMd;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    initialData();
    super.onInit();

  }

  @override
  initialData() {
    itemsMd = Get.arguments['itemsMD'];
  }

  @override
  goBack() {
    Get.off(const ItemsView());
  }


}