import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/data/data_source/remote/offers_data.dart';
import 'package:shop_savvy/data/model/items_model.dart';

class OffersController extends GetxController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsMd> itemsListData = [];
  StatusRequest statusRequest = StatusRequest.none;

  getOffers() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    debugPrint("================= HomeController $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        itemsListData.addAll(data.map((e) => ItemsMd.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOffers();
    super.onInit();
  }
}
