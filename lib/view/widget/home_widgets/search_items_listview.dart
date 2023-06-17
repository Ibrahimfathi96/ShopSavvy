import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home_controllers/home_controller.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/link_api.dart';

class ItemsListSearch extends GetView<HomeControllerImp> {
  final List<ItemsMd> searchDataList;

  const ItemsListSearch({super.key, required this.searchDataList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: searchDataList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            controller.goToProductDetails(searchDataList[index]);
          },
          child: Card(
            elevation: 30,
            child: Row(
              children: [
                Container(
                  color: const Color(0xFFFBF3E8),
                  child: Expanded(
                    child: CachedNetworkImage(
                      imageUrl:
                      "${AppLink.imagesItems}/${searchDataList[index].itemsImage}",
                      height: Get.height / 8,
                      width: Get.width / 4,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(
                      searchDataList[index].itemsName!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(searchDataList[index].categoriesName!),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
