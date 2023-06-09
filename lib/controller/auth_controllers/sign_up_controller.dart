import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/data/data_source/remote/auth/sign_up_remotedata.dart';
import 'package:shop_savvy/view/screen/auth_view/sign_in.dart';
import 'package:shop_savvy/view/screen/auth_view/sign_up/verify_code_sign_up.dart';

abstract class SignUpController extends GetxController {
  singUp();

  goToSignIn();

  showPassword();

  verifyPhoneNumber(String phone);
  createAccountWithFirebaseAuth();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());
  List data = [];
  var authState = ''.obs;
  String verificationID = '';
  var authServices = FirebaseAuth.instance;

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
      // await verifyPhoneNumber(phoneController.text);
      // await createAccountWithFirebaseAuth();
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(SignUpVerifyCode.routeName,
              arguments: {"email": emailController.text});
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

  @override
  verifyPhoneNumber(String phone) async {
    await authServices.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 40),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await authServices.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException authException) {
        if (authException.code == 'invalid-phone-number') {
          Get.snackbar(
              "Code Error!", 'The provided phone number is not valid.');
        } else {
          Get.snackbar(
              "Unknown Error!", "Something Went Wrong While Sending the code");
        }
      },
      codeSent: (String id, int? resendToken) {
        verificationID = id;
        authState.value = "Success Login With Phone";
      },
      codeAutoRetrievalTimeout: (String id) {
        verificationID = id;
      },
    );
  }

  @override
  createAccountWithFirebaseAuth() async {
    try {
      var credential = await authServices.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.snackbar("UserID!", credential.user?.uid ?? "");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Warning!", "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Warning!", "The account already exists for that email.");
      }
    } catch (e) {
      Get.snackbar("Warning!",
          "something went wrong, please try again later,\n${e.toString()}");
    }
  }
}
