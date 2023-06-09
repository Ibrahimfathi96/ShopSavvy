import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home_controllers/home_controller.dart';
import 'package:shop_savvy/data/model/categories_model.dart';
import 'package:shop_savvy/link_api.dart';

class HomeCategoriesListViewItem extends GetView<HomeControllerImp> {
  final int selectedCategory ;
  final CategoriesMD categoriesMD;
  const HomeCategoriesListViewItem( {required this.selectedCategory,required this.categoriesMD,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.goToItems(controller.categories, selectedCategory);
      },
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.imagesCategories}/${categoriesMD.categoriesImage}",
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "${categoriesMD.categoriesName}",
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
