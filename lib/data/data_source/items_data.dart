import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class ItemsData{
  Crud crud;

  ItemsData(this.crud);
  getData(String id)async{
    var response = await crud.postData(AppLink.itemsPHP, {"id":id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}