import 'package:get/get.dart';

validInput(String val, int min, int max, String type){
  if(type == "username"){
    if(!GetUtils.isUsername(val)){
      return "Not Valid User Name";
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "Not Valid Email Address";
    }
  }
  if(type == "phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "Not Valid Phone Number";
    }
  }

  if(val.isEmpty){
    return "Required Field! Can't be empty.";
  }

  if(val.length < min){
    return "Can't be less than $min";
  }

  if(val.length > max){
    return "Can't be larger than $max";
  }

}