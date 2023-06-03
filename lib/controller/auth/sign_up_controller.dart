import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/data/data_source/remote/auth/sign_up_remotedata.dart';
import 'package:shop_savvy/view/screen/auth/sign_in.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/verify_code_sign_up.dart';

abstract class SignUpController extends GetxController {
  singUp();

  goToSignIn();

  showPassword();

  verifyPhone(String phone);
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible = true;
  StatusRequest? statusRequest;
  SignUpData signUpData = SignUpData(Get.find());
  List data = [];
  var authState = ''.obs;
  String verificationID = '';
  var auth = FirebaseAuth.instance;

  @override
  verifyPhone(String phone) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+201156789207',
      timeout: const Duration(seconds: 40),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (authException) {
        Get.snackbar("Error", "Problem when send the code.");
      },
      codeSent: (String id, int? forceResent) {
        verificationID = id;
        authState.value = "Login Success";
      },
      codeAutoRetrievalTimeout: (id) {
        verificationID = id;
      },
    );
  }


  @override
  showPassword() {
    isVisible = isVisible == true ? false : true;
    update();
  }

  @override
  void onInit() {
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToSignIn() {
    Get.offNamed(SignIn.routeName);
  }

  @override
  singUp() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(fullNameController.text,
          passwordController.text, emailController.text, phoneController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(SignUpVerifyCode.routeName,
              arguments: {"phone": phoneController.text});
        } else {
          Get.defaultDialog(
              title: "Warning!",
              middleText: ("Phone Number or Email is already Exists."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Ok"),
                ),
              ]);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      debugPrint("Valid");
    } else {
      debugPrint("Not Valid");
    }
  }
}
