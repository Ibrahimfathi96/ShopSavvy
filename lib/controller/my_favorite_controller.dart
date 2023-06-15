import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/favorite/my_favorite_data.dart';
import 'package:shop_savvy/data/model/my_favorite_model.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteMd> data = [];
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  @override
  onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getData(services.prefs.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteMd.fromJson(e)));
        debugPrint("data $data");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
