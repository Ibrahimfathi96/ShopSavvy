import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/auth/sign_in_remote.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/forget_password.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/sign_up.dart';
import 'package:shop_savvy/view/screen/home/home.dart';

abstract class SignInController extends GetxController {
  singIn();

  goToSignUP();

  goToForgetPassword();

  showPassword();
}

class SignInControllerImp extends SignInController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isVisible = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignInData signInData = SignInData(Get.find());
  FirebaseAuth authServices = FirebaseAuth.instance;
  MyServices services = Get.find();

  @override
  showPassword() {
    isVisible = isVisible == true ? false : true;
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      debugPrint("=========================FirebaseToken $value");
      String? token = value;
    });
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToSignUP() {
    Get.offNamed(SignUp.routeName);
  }

  @override
  singIn() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signInData.postData(
        emailController.text,
        passwordController.text,
      );
      debugPrint("============= SignInController $response");
      // await signInWithFirebase();
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          services.prefs.setString("id", response['data']['users_id'].toString());
          services.prefs.setString("email", response['data']['users_email']);
          services.prefs.setString("phone", response['data']['users_phone']);
          services.prefs.setString("userName", response['data']['users_name']);
          services.prefs.setString("step", "2");
          Get.offAllNamed(HomeView.routeName);
        } else {
          Get.defaultDialog(
              title: "Warning!",
              middleText: ("Something went wrong with your email or password."),
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

  @override
  goToForgetPassword() {
    Get.toNamed(ForgetPassword.routeName);
  }

  signInWithFirebase() async {
    try {
      var credential = await authServices.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Get.snackbar("User Credential", credential.user?.uid ?? '');
      debugPrint(credential.user.toString());
      if (credential.user?.uid != null) {
        Get.offAllNamed(HomeView.routeName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('user-not-found', "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
            'wrong-password', "Wrong password provided for that user.");
      }
    } catch (e) {
      Get.snackbar('Un-Known Error!',
          "something went wrong, please try again later,\n${e.toString()}");
    }
  }
}
