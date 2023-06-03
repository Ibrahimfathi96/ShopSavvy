import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/sign_up_successfully.dart';

abstract class SignUpVerifyCodeController extends GetxController{
  checkCode();
  goToSignUpSuccess();
  verifyOtp(String otp);
}

class SignUpVerifyCodeControllerImp extends SignUpVerifyCodeController{
  late String verifyCode;
  String? phone;

  String verificationID = '';

  var auth = FirebaseAuth.instance;

  @override
  void onInit() {
    phone = Get.arguments["phone"];
    super.onInit();
  }

  @override
  checkCode() {}

  @override
  goToSignUpSuccess() {
    Get.offAllNamed(SignUpSuccessfully.routeName);
  }

  @override
  verifyOtp(String otp)async{
    var credential =  await auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: otp));
    if(credential.user!=null){
      goToSignUpSuccess();
    }
  }

}