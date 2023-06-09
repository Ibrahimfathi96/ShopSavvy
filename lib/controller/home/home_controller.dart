import 'package:get/get.dart';
import 'package:shop_savvy/core/services/services.dart';

class HomeController extends GetxController{}
class HomeControllerImp extends HomeController{
  MyServices myServices = Get.find();
  String? userName;
  String? id;
  initialData(){
    userName = myServices.prefs.getString("userName");
    id = myServices.prefs.getString("id");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
