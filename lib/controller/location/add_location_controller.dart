import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/location_data/add_location_data.dart';
import 'package:shop_savvy/view/screen/home/home_screen.dart';

class AddLocationController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController cityController;
  late TextEditingController streetController;
  String? lat;
  String? lng;
  List<Marker> markers = [];
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  CameraPosition? kGooglePlex;
  late Completer<GoogleMapController> completerController;
  AddLocationData addLocationData = AddLocationData(Get.find());
  MyServices myServices = Get.find();

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude.toString();
    lng = latLng.longitude.toString();
    update();
  }

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 15,
    );
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  addLocation() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addLocationData.getData(
          myServices.prefs.getString("id")!,
          nameController.text,
          cityController.text,
          streetController.text,
          lat!,
          lng!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(HomeScreen.routeName);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      debugPrint("Valid");
    } else {
      debugPrint("Not Valid");
    }
  }

  initData() {
    nameController = TextEditingController();
    cityController = TextEditingController();
    streetController = TextEditingController();
  }

  @override
  void onInit() {
    initData();
    getCurrentLocation();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}
