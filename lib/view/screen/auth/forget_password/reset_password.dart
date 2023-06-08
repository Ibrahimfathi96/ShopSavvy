import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/forget_password/reset_password_controller.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/valid_input.dart';
import 'package:shop_savvy/view/widget/auth/auth_body_text.dart';
import 'package:shop_savvy/view/widget/auth/auth_title_text.dart';
import 'package:shop_savvy/view/widget/auth/custom_text_form_field.dart';
import 'package:shop_savvy/view/widget/auth/cutom_auth_button.dart';

class ResetPassword extends StatelessWidget {
  static const String routeName = '/reset-password';

  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 0,
        title: Text("41".tr),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) =>
              controller.statusRequest == StatusRequest.loading
                  ? const Center(
                      child: Text("loading..."),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: Form(
                        key: controller.formKey,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            CustomAuthTitleText(
                              text: "42".tr,
                            ),
                            CustomAuthBodyText(
                              text: "43".tr,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomAuthTextFormField(
                              validator: (val) {
                                return validInput(val!, 8, 30, "password");
                              },
                              textInputAction: TextInputAction.next,
                              onPressed: () {
                                controller.showPassword1();
                              },
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "44".tr,
                              labelText: "45".tr,
                              iconData: controller.isVisible1
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              obscureText: controller.isVisible1,
                              controller: controller.newPassword,
                            ),
                            CustomAuthTextFormField(
                              validator: (val) {
                                return validInput(val!, 8, 30, "password");
                              },
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "46".tr,
                              labelText: "47".tr,
                              iconData: controller.isVisible2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              obscureText: controller.isVisible2,
                              controller: controller.confirmPassword,
                              onPressed: () {
                                controller.showPassword2();
                              },
                            ),
                            CustomAuthButton(
                              text: "48".tr,
                              onPressed: () {
                                controller.goToResetPasswordSuccessfully();
                              },
                            ),
                          ],
                        ),
                      ),
                    )),
    );
  }
}
