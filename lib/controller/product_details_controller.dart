import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/cart_controller.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/view/screen/cart/cart_view.dart';
import 'package:shop_savvy/view/screen/items/items_view.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();

  goBack();

  goToCart();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartController cartController = Get.put(CartController());
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
    itemsCount =
        await cartController.getCartItemsCount(itemsMd.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  cartItemCounterIncrement() {
    cartController.addToCart(itemsMd.itemsId.toString());
    itemsCount++;
    update();
  }

  cartItemCounterDecrement() {
    if (itemsCount > 0) {
      cartController.deleteFromCart(itemsMd.itemsId.toString());
      itemsCount--;
      update();
    }
  }

  @override
  goBack() {
    Get.off(const ItemsView());
  }

  @override
  goToCart() {
    Get.toNamed(CartView.routeName);
  }
}
