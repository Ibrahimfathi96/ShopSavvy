import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/search_controller.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/home_data.dart';
import 'package:shop_savvy/view/screen/items/items_view.dart';
import 'package:shop_savvy/view/screen/product_details/product_details.dart';

class HomeControllerImp extends SearchMixControllerImp {
  MyServices myServices = Get.find();
  String? userName;
  String? id;
  String homeCardTitle = '';
  String homeCardBody = '';
  int deliveryTime = 0;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List salesData = [];
  List items = [];
  String? lang;

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  initialData() {
    userName = myServices.prefs.getString("userName");
    id = myServices.prefs.getString("id");
    lang = myServices.prefs.getString("lang");
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    debugPrint("================= HomeController $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        salesData.addAll(response['sales']['data']);
        homeCardTitle = salesData[0]['sales_title'];
        homeCardBody  = salesData[0]['sales_body'];
        deliveryTime  = salesData[0]['sales_delivery_time'];
        myServices.prefs.setInt('deliveryTime', deliveryTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToItems(categories, selectedCategory, categoryId) {
    Get.toNamed(ItemsView.routeName, arguments: {
      "categories": categories,
      "selectedCategory": selectedCategory,
      "categoryId": categoryId,
    });
  }

  goToProductDetails(itemsMd) {
    Get.toNamed(ProductDetails.routeName, arguments: {
      "itemsMD": itemsMd,
    });
  }
}
