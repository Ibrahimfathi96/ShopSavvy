import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/data/data_source/items_data.dart';

abstract class ItemsController extends GetxController {
  initialData();

  goBack();

  changeCategoryOnTap(int val);

  getItems(String categoryId);

  addToFavourite(int itemsId);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCategory;
  String? catId;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  bool addedToFavourite = false;

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
    catId = Get.arguments['categoryId'];
    getItems(catId!);
  }

  @override
  changeCategoryOnTap(val) {
    selectedCategory = val;
    update();
  }

  @override
  getItems(categoryId) async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryId);
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

  @override
  addToFavourite(itemsId) {
    addedToFavourite = addedToFavourite == false? true:false;
    update();
  }
}
