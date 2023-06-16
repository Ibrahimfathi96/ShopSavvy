import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/view/screen/items/items_view.dart';


abstract class ProductDetailsController extends GetxController{
  initialData();
  goBack();
}
class ProductDetailsControllerImp extends ProductDetailsController{
  late ItemsMd itemsMd;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List subItems = [
    {"name":"Red", "id":1, "active":"1","color":Colors.red},
    {"name":"Grey", "id":2, "active":"0","color":Colors.grey},
    {"name":"Black", "id":3, "active":"0","color":Colors.black},
  ];

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