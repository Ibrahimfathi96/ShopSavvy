import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/cart/add_to_cart.dart';
import 'package:shop_savvy/data/data_source/remote/cart/cart_items_count_data.dart';
import 'package:shop_savvy/data/data_source/remote/cart/remove_from_cart.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/data/model/my_favorite_model.dart';
import 'package:shop_savvy/view/screen/cart/cart_view.dart';
import 'package:shop_savvy/view/screen/home/home_screen.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();

  goBack();

  goToCart();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  AddToCartData addToCartData = AddToCartData(Get.find());
  RemoveFromCartData removeFromCartData = RemoveFromCartData(Get.find());
  CartItemsCount cartItemsCount = CartItemsCount(Get.find());
  MyServices services = Get.find();
  late ItemsMd itemsMd;
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int itemsCount = 0;
  List subItems = [
    {"name": "Red", "id": 1, "active": "1", "color": Colors.red},
    {"name": "Grey", "id": 2, "active": "0", "color": Colors.grey},
    {"name": "Black", "id": 3, "active": "0", "color": Colors.black},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsMd = Get.arguments['itemsMD'];
    itemsCount = await getCartItemsCount(itemsMd.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  addToCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await addToCartData.getData(services.prefs.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "إشعار",
            messageText: const Text("تم إضافة المنتج إلي السلة"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await removeFromCartData.getData(
        services.prefs.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "إشعار", messageText: const Text("تم حذف المنتج من السلة"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  cartItemCounterIncrement() {
    addToCart(itemsMd.itemsId.toString());
    itemsCount++;
    update();
  }

  getCartItemsCount(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response =
        await cartItemsCount.getData(services.prefs.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        int itemsCount = 0;
        itemsCount = response['data'];
        debugPrint("===========getCountItems $itemsCount");
        return itemsCount;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  cartItemCounterDecrement() {
    if (itemsCount > 0) {
      deleteFromCart(itemsMd.itemsId.toString());
      itemsCount--;
      update();
    }
  }

  @override
  goBack() {
    Get.offNamed(HomeScreen.routeName);
  }

  @override
  goToCart() {
    Get.toNamed(CartView.routeName);
  }
}
