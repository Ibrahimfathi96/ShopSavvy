import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/orders/archive_orders_data.dart';
import 'package:shop_savvy/data/data_source/remote/rating_data.dart';
import 'package:shop_savvy/data/model/orders_model.dart';

class ArchiveOrdersController extends GetxController {
  ArchiveOrdersData archiveOrdersData = ArchiveOrdersData(Get.find());
  RatingData ratingData = RatingData(Get.find());
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersMd> ordersList = [];
  bool isSelected = false;

  toggleBetweenOrderType() {
    isSelected = isSelected == false ? true : false;
    update();
  }

  getArchivedOrders() async {
    ordersList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await archiveOrdersData.getData(services.prefs.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        ordersList.addAll(data.map((e) => OrdersMd.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  submitRating(String orderId, String rating, String ratingComment) async {
    ordersList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ratingData.getData(
      orderId,
      rating,
      ratingComment,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        debugPrint("Submit Rating==============>Success");
        getArchivedOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrdersPage() {
    getArchivedOrders();
  }

  String printPaymentMethod(num val) {
    if (val == 1) {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderType(num val) {
    if (val == 0) {
      return "Delivery";
    } else {
      return "Receive";
    }
  }

  String printOrderStatus(num val) {
    if (val == 0) {
      return "Pending approval";
    } else if (val == 1) {
      return "Preparing";
    } else if (val == 2) {
      return "Ready";
    } else if (val == 3) {
      return "On The Way";
    } else {
      return "Archived";
    }
  }

  Color orderStatusColor(num val) {
    if (val == 0) {
      return Colors.red;
    } else if (val == 1) {
      return AppColors.primaryColor;
    } else if (val == 2) {
      return Colors.green;
    } else if (val == -1) {
      return Colors.green;
    } else {
      return AppColors.primaryDark;
    }
  }

  @override
  void onInit() {
    getArchivedOrders();
    super.onInit();
  }
}
