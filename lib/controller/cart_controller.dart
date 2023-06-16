import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/cart/add_to_cart.dart';
import 'package:shop_savvy/data/data_source/remote/cart/cart_items_count_data.dart';
import 'package:shop_savvy/data/data_source/remote/cart/remove_from_cart.dart';
import 'package:shop_savvy/data/data_source/remote/cart/view.dart';
import 'package:shop_savvy/data/model/cart_model.dart';

class CartController extends GetxController {
  AddToCartData addToCartData = AddToCartData(Get.find());
  CartItemsCount cartItemsCount = CartItemsCount(Get.find());
  RemoveFromCartData removeFromCartData = RemoveFromCartData(Get.find());
  CartViewData cartViewData = CartViewData(Get.find());
  List<CartMd> data = [];
  num ordersPrice = 0;
  num countTotalItems = 0;

  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  addToCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
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
  }

  deleteFromCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
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
  }

  cartView() async {
    statusRequest = StatusRequest.loading;
    var response = await cartViewData.getData(services.prefs.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataResponse = response['data'];
        Map priceCountResponse = response['countprice'];
        data.addAll(dataResponse.map((e) => CartMd.fromJson(e)));
        countTotalItems = int.parse(priceCountResponse['totalcount']);
        ordersPrice = priceCountResponse['totalprice'];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
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

  @override
  void onInit() {
    cartView();
    super.onInit();
  }
}
