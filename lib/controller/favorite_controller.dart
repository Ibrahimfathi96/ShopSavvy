import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/favorite/add_to_favorite_data.dart';
import 'package:shop_savvy/data/data_source/remote/favorite/remove_from_favorite_data.dart';

class FavoriteController extends GetxController {
  List data = [];
  MyServices services = Get.find();
  AddToFavoriteData addToFavoriteData = AddToFavoriteData(Get.find());
  RemoveFromFavoriteData removeFromFavoriteData =
      RemoveFromFavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addToFavorite(String itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await addToFavoriteData.getData(
        services.prefs.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title:"إشعار", messageText: const Text("تم إضافة المنتج إلي المفضلة"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFromFavorite(String itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await removeFromFavoriteData.getData(
        services.prefs.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title:"إشعار", messageText: const Text("تم حذف المنتج من المفضلة"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
