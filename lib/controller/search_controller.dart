import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/data/data_source/remote/search.dart';
import 'package:shop_savvy/data/model/items_model.dart';

abstract class SearchMixController extends GetxController {
  checkSearching(val);

  searchData();

  clearController(BuildContext context);

  onItemsSearching();

}

class SearchMixControllerImp extends SearchMixController {
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController searchController;
  List<ItemsMd> searchList = [];
  SearchItemsData searchItemsData = SearchItemsData(Get.find());
  bool searching = false;

  @override
  clearController(context) {
    searchController.clear();
    searching = false;
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    update();
  }

  @override
  checkSearching(val) {
    if (val.trim().isEmpty) {
      statusRequest = StatusRequest.none;
      searching = false;
    }
    update();
  }

  @override
  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await searchItemsData.getData(searchController.text);
    debugPrint("================= HomeController $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        searchList.clear();
        List responseData = response['data'];
        searchList.addAll(responseData.map((e) => ItemsMd.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  onItemsSearching() {
    searching = true;
    searchData();
    update();
  }


  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }
}
