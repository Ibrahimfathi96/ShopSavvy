import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/reset_password.dart';

abstract class ForgetPasswordVerifyCodeController extends GetxController {
  verifyOtp(String otp);

  goToResetPassword();
}

class ForgetPasswordVerifyCodeControllerImp
    extends ForgetPasswordVerifyCodeController {
  late String verifyCode;
  String? phone;
  var auth = FirebaseAuth.instance;
  String verificationID = '';

  @override
  void onInit() {
    phone = Get.arguments["phone"];
    super.onInit();
  }

  @override
  verifyOtp(String otp) async {
    var credential = await auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: otp,
      ),
    );
    if (credential.user?.uid != null) {
      goToResetPassword();
    }
  }

  @override
  goToResetPassword() {
    Get.offAllNamed(ResetPassword.routeName);
  }
}
