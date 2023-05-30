import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/test/test_data.dart';

class TestController extends GetxController{
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  getData()async{
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=='success'){
      data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}