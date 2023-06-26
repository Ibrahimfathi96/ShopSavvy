import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/orders/pending_data.dart';
import 'package:shop_savvy/data/model/pending_orders_model.dart';

class PendingOrdersController extends GetxController {
  PendingOrdersData ordersData = PendingOrdersData(Get.find());
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<PendingOrdersMd> pendingDataList = [];

  getPendingOrders() async {
    pendingDataList.clear();
    statusRequest = StatusRequest.loading;
    var response = await ordersData.getData(services.prefs.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        pendingDataList.addAll(data.map((e) => PendingOrdersMd.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String printPaymentMethod(num val){
    if(val == 1){
      return "Cash On Delivery";
    }else{
      return "Payment Card";
    }
  }
  String printOrderType(num val){
    if(val == 0){
      return "Delivery";
    }else{
      return "Receive";
    }
  }
  String printOrderStatus(num val){
    if(val == 0){
      return "Pending For Approval";
    }else if(val == 1){
      return "Currently is Preparing";
    }else if(val == 2){
      return "Done";
    }else if(val == -1){
      return "Delivered";
    }else{
      return "On The Way to you";
    }
  }
  Color orderStatusColor(num val){
    if(val == 0){
      return Colors.red;
    }else if(val == 1){
      return AppColors.primaryColor;
    }else if(val == 2){
      return Colors.green;
    }else if(val == -1){
      return Colors.green;
    }else{
      return AppColors.primaryDark;
    }
  }
  @override
  void onInit() {
    getPendingOrders();
    super.onInit();
  }
}
