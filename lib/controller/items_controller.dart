import 'package:get/get.dart';
import 'package:shop_savvy/controller/search_controller.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/items_data.dart';
import 'package:shop_savvy/view/screen/home/home_screen.dart';
import 'package:shop_savvy/view/screen/product_details/product_details.dart';

class ItemsControllerImp extends SearchMixControllerImp {
  List categories = [];
  int? selectedCategory;
  String? catId;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  MyServices services = Get.find();
  late int deliveryTime;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }


  goBack() {
    Get.off(const HomeScreen());
  }

  initialData() {
    deliveryTime = services.prefs.getInt("deliveryTime")!;
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selectedCategory'];
    catId = Get.arguments['categoryId'];
    getItems(catId!);
  }


  changeCategoryOnTap(val, categoryVal) {
    selectedCategory = val;
    catId = categoryVal;
    getItems(catId!);
    update();
  }


  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await itemsData.getData(categoryId, services.prefs.getString("id")!);
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


  goToProductDetails(itemsMd) {
    Get.toNamed(ProductDetails.routeName, arguments: {
      "itemsMD": itemsMd,
    });
  }
}
