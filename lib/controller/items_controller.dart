import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/items_data.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/view/screen/home/home_screen.dart';
import 'package:shop_savvy/view/screen/product_details/product_details.dart';

abstract class ItemsController extends GetxController {
  initialData();

  goBack();

  changeCategoryOnTap(int val,String categoryVal);

  getItems(String categoryId);

  goToProductDetails(ItemsMd itemsMd);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCategory;
  String? catId;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices services = Get.find();

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  goBack() {
    Get.off(const HomeScreen());
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selectedCategory'];
    catId = Get.arguments['categoryId'];
    getItems(catId!);
  }

  @override
  changeCategoryOnTap(val,categoryVal) {
    selectedCategory = val;
    catId = categoryVal;
    getItems(catId!);
    update();
  }

  @override
  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryId,services.prefs.getString("id")!);
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
  goToProductDetails(itemsMd) {
    Get.toNamed(ProductDetails.routeName, arguments: {
      "itemsMD": itemsMd,
    });
  }
}
