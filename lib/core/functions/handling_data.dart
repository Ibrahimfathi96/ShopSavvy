import 'package:shop_savvy/core/class/status_request.dart';

handlingData(response){
  if(response is StatusRequest){
    return response;
  }else{
    return StatusRequest.success;
  }
}