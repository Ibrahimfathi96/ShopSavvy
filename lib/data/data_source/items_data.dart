import 'package:shop_savvy/core/class/crud.dart';
import 'package:shop_savvy/link_api.dart';

class ItemsData{
  Crud crud;

  ItemsData(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.itemsPHP, {});
    return response.fold((l) => l, (r) => r);
  }
}