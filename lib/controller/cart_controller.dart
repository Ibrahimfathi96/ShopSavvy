import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/cart/add_to_cart.dart';
import 'package:shop_savvy/data/data_source/remote/cart/remove_from_cart.dart';
import 'package:shop_savvy/data/data_source/remote/cart/view.dart';
import 'package:shop_savvy/data/model/cart_model.dart';

class CartController extends GetxController {
  AddToCartData addToCartData = AddToCartData(Get.find());
  RemoveFromCartData removeFromCartData = RemoveFromCartData(Get.find());
  CartViewData cartViewData = CartViewData(Get.find());
  List<CartMd> data = [];
  num ordersPrice = 0;
  num countTotalItems = 0;

  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;


  cartView() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartViewData.getData(services.prefs.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if(response['data']['status']== 'success'){
          List dataResponse = response['data']['data'];
          Map priceCountResponse = response['countprice'];
          data.clear();
          data.addAll(dataResponse.map((e) => CartMd.fromJson(e)));
          countTotalItems = int.parse(priceCountResponse['totalcount']);
          ordersPrice = priceCountResponse['totalprice'];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
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

  resetCartsVariable(){
    countTotalItems = 0;
    ordersPrice     = 0;
    data.clear();
  }

  refreshPage(){
    resetCartsVariable();
    cartView();
  }

  @override
  void onInit() {
    cartView();
    super.onInit();
  }
}
