import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/test/test_controller.dart';

class TestView extends StatelessWidget {
  static const String routeName = '/';
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: const Text("Title"),),
      body: GetBuilder<TestController>(
        builder: (controller){
          if(controller.statusRequest == StatusRequest.loading){
            return const Center(child: Text("loading"),);
          }else if(controller.statusRequest == StatusRequest.internetFailure){
            return const Center(child: Text("internet Error"),);
          }else if(controller.statusRequest == StatusRequest.serverFailure){
            return const Center(child: Text("server failure"),);
          }else if(controller.statusRequest == StatusRequest.failure){
            return const Center(child: Text("There's no available data right now."),);
          }else{
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data}");
            },);
          }
        },
      ),
    );
  }
}
