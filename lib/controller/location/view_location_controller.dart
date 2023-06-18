import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/location_data/delete_location_data.dart';
import 'package:shop_savvy/data/data_source/remote/location_data/view_location_data.dart';
import 'package:shop_savvy/data/model/location_model.dart';

class ViewLocationController extends GetxController {
  ViewLocationData viewLocationData = ViewLocationData(Get.find());
  DeleteLocationData deleteLocationData = DeleteLocationData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<LocationMd> locationDataList = [];

  getLocationData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await viewLocationData.getData(myServices.prefs.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        locationDataList.addAll(data.map((e) => LocationMd.fromJson(e)));
      if(locationDataList.isEmpty){
        statusRequest = StatusRequest.failure;
      }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteLocation(String locationId) async {
    await deleteLocationData.getData(locationId);
    locationDataList.removeWhere((element) => element.locationId.toString() == locationId);
    update();
  }

  @override
  void onInit() {
    getLocationData();
    super.onInit();
  }
}
