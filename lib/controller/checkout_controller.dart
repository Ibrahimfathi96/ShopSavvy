import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/location_data/view_location_data.dart';
import 'package:shop_savvy/data/model/location_model.dart';

class CheckOutController extends GetxController{
  ViewLocationData viewLocationData = ViewLocationData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliveryMethod;
  String? locationId;
  List<LocationMd> locationListData = [] ;
  MyServices myServices = Get.find();

  getLocationData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
    await viewLocationData.getData(myServices.prefs.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        locationListData.addAll(data.map((e) => LocationMd.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  choosePaymentMethod(String val){
    paymentMethod = val;
    update();
  }
  chooseDeliveryMethod(String val){
    deliveryMethod = val;
    update();
  }
  chooseShippingLocation(String val){
    locationId = val;
    update();
  }
  @override
  void onInit() {
    getLocationData();
    super.onInit();
  }
}