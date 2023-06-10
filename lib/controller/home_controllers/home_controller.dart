import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/home_data.dart';
import 'package:shop_savvy/view/screen/items_view/items_view.dart';

abstract class HomeController extends GetxController {
  initialData();

  getData();

  goToItems(List categories, int selectedCategory);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? userName;
  String? id;
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  initialData() {
    userName = myServices.prefs.getString("userName");
    id = myServices.prefs.getString("id");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    debugPrint("================= HomeController $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCategory) {
    Get.toNamed(ItemsView.routeName, arguments: {
      "categories": categories,
      "selectedCategory": selectedCategory,
    });
  }
}