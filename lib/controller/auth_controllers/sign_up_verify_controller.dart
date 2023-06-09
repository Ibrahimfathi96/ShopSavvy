import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/data/data_source/remote/auth/signup_verify_code_remote.dart';
import 'package:shop_savvy/view/screen/auth_view/sign_up/sign_up_successfully.dart';

abstract class SignUpVerifyCodeController extends GetxController {
  checkCode();

  goToSignUpSuccess(String verifyCode);

  verifyOtp(String otp);
}

class SignUpVerifyCodeControllerImp extends SignUpVerifyCodeController {
  String? email;
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String verificationID = '';

  var auth = FirebaseAuth.instance;

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  checkCode() {}

  @override
  goToSignUpSuccess(verifyCode) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(email!, verifyCode);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] =='success'){
        debugPrint("==================VerifyCodeSignUPController $response");
        Get.offNamed(SignUpSuccessfully.routeName);
      }else{
        Get.defaultDialog(
          title: "Warning!",
          middleText: "Verify Code isn't Correct."
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  verifyOtp(String otp) async {
    var credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationID, smsCode: otp));
    if (credential.user?.uid != null) {
      // goToSignUpSuccess();
    }
  }
}
