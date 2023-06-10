import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/data/data_source/items_data.dart';

abstract class ItemsController extends GetxController {
  initialData();

  goBack();

  changeCategoryOnTap(int val);

  getItems();
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCategory;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;

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
    getItems();
  }

  @override
  changeCategoryOnTap(val) {
    selectedCategory = val;
    update();
  }

  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
