import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth_controllers/sign_up_success_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/view/widget/auth_widgets/cutom_auth_button.dart';

class SignUpSuccessfully extends StatelessWidget {
  static const String routeName = '/sign-up-successfully';

  const SignUpSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpSuccessControllerImp controller = Get.put(
        SignUpSuccessControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "32".tr,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: HandlingRequests(
        statusRequest: controller.statusRequest,
        widget: Container(
          alignment: Alignment.center,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2,),
              const Icon(
                Icons.check_circle_outline_outlined,
                size: 200,
                color: Colors.deepOrangeAccent,
              ),
              Text(
                "33".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "34".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const Spacer(flex: 8,),
              CustomAuthButton(
                text: "35".tr,
                onPressed: () {
                  controller.goToSignIn();
                },
              ),
              const Spacer(flex: 2,)
            ],
          ),
        ),
      ),
    );
  }
}
