import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
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

  @override
  void onInit() {
    getPendingOrders();
    super.onInit();
  }
}
