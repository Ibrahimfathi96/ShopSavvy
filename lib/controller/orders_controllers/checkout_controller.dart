import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/location_data/view_location_data.dart';
import 'package:shop_savvy/data/data_source/remote/orders/checkout_data.dart';
import 'package:shop_savvy/data/model/location_model.dart';
import 'package:shop_savvy/view/screen/home/home_screen.dart';
import 'package:shop_savvy/view/screen/location/add_location.dart';

class CheckOutController extends GetxController {
  ViewLocationData viewLocationData = Get.put(ViewLocationData(Get.find()));
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliveryMethod;
  String locationId = '0';
  late String ordersPrice;
  late String couponId;
  late String couponDiscount;
  List<LocationMd> locationListData = [];
  MyServices myServices = Get.find();

  getLocationData() async {
    statusRequest = StatusRequest.loading;
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

  goToAddNewLocation(){
    Get.toNamed(AddLocation.routeName);
  }
  checkout() async {
    if (paymentMethod == null)
      return Get.snackbar("Warning!", "Please Choose a payment method.");
    if (deliveryMethod == null)
      return Get.snackbar("Warning!", "Please Choose a delivery method.");
    if(locationListData.isEmpty || locationId == "0"){
      return Get.snackbar("Warning!", "Please Choose your shipping location.");
    }
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkOutData.getData(
      userId: services.prefs.getString('id')!,
      couponId: couponId,
      locationId: locationId,
      ordersDeliveryPrice: "35",
      ordersPrice: ordersPrice,
      ordersType: deliveryMethod!,
      paymentMethod: paymentMethod!,
      couponDiscount: couponDiscount,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //TODO Order Success UI
        Get.offAllNamed(HomeScreen.routeName);
        Get.snackbar("Success!", "your order is ordered successfully");
        print('===============OrdersCheckout success');
      } else {
        statusRequest = StatusRequest.none;
        print('===============Checkout Failure');
        Get.snackbar("Error!", "Something went wrong, try again later.");
      }
    }
    update();
  }

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryMethod(String val) {
    deliveryMethod = val;
    update();
  }

  chooseShippingLocation(String val) {
    locationId = val;
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponId'].toString();
    ordersPrice = Get.arguments['ordersPrice'].toString();
    couponDiscount = Get.arguments['couponDiscount'].toString();
    getLocationData();
    super.onInit();
  }
}
