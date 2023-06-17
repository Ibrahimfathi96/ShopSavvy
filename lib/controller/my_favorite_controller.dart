import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/favorite_controller.dart';
import 'package:shop_savvy/controller/search_controller.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/favorite/delete_my_favorite.dart';
import 'package:shop_savvy/data/data_source/remote/favorite/my_favorite_data.dart';
import 'package:shop_savvy/data/model/my_favorite_model.dart';
import 'package:shop_savvy/view/screen/home/home_screen.dart';
import 'package:shop_savvy/view/screen/product_details/product_details.dart';

class MyFavoriteController extends SearchMixControllerImp {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  FavoriteController favoriteController = Get.put(FavoriteController());
  DeleteFromFavoriteData deleteFromFavoriteData =
      DeleteFromFavoriteData(Get.find());
  List<MyFavoriteMd> data = [];
  MyServices services = Get.find();

  @override
  onInit() {
    super.onInit();
    getData();
  }
  goBack() {
    Get.off(const HomeScreen());
  }
  // goToProductDetails(MyFavoriteMd itemsMd) {
  //   Get.toNamed(ProductDetails.routeName, arguments: {
  //     "favitemsMd": itemsMd,
  //   });
  // }

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

  deleteData(String favId) {
    deleteFromFavoriteData.getData(favId);
    data.removeWhere((element) => element.favoriteId.toString() == favId);
    favoriteController.data
        .removeWhere((element) => element.favoriteItemsId.toString() == favId);
    update();
  }
}
