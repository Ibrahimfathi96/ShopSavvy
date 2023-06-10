import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();

  goBack();

  changeCategoryOnTap(int val);

}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCategory;
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  goBack() {
    Get.back();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selectedCategory'];
  }

  @override
  changeCategoryOnTap(val) {
    selectedCategory = val;
    update();
  }
}
