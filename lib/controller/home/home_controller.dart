import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/home_data.dart';

abstract class HomeController extends GetxController{
  initialData();
  getData();
}
class HomeControllerImp extends HomeController{
  MyServices myServices = Get.find();
  String? userName;
  String? id;
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];



  @override
  initialData(){
    userName = myServices.prefs.getString("userName");
    id = myServices.prefs.getString("id");
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async{
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    debugPrint("================= HomeController $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=='success'){
        categories.addAll(response['categories']);
        // items.addAll(response['items']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
