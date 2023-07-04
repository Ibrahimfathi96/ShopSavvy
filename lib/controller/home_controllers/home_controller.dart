import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/search_controller.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/home_data.dart';
import 'package:shop_savvy/view/screen/items/items_view.dart';

class HomeControllerImp extends SearchMixControllerImp {
  MyServices myServices = Get.find();
  String? userName;
  String? id;
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
}
