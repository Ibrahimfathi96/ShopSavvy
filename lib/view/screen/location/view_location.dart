import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/location/view_location_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/data/model/location_model.dart';
import 'package:shop_savvy/view/screen/location/add_location.dart';

class LocationView extends StatelessWidget {
  static const String routeName = '/location-view';

  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewLocationController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryDark,
        onPressed: () {
          Get.toNamed(AddLocation.routeName);
        },
        child: const Icon(Icons.add, size: 36),
      ),
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryDark,
            size: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Your Location Info",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: GetBuilder<ViewLocationController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            child: ListView.builder(
              itemCount: controller.locationDataList.length,
              itemBuilder: (context, index) => LocationViewCard(
                onDeletePress: () {
                  controller.deleteLocation(
                      controller.locationDataList[index].locationId.toString());
                },
                onEditPress: () {},
                locationMd: controller.locationDataList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LocationViewCard extends StatelessWidget {
  final LocationMd locationMd;
  final void Function() onEditPress;
  final void Function() onDeletePress;

  const LocationViewCard(
      {super.key,
      required this.locationMd,
      required this.onEditPress,
      required this.onDeletePress});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin:
          EdgeInsets.symmetric(horizontal: 16).add(EdgeInsets.only(top: 10)),
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0x85BBEDED),
            borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Your Address",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.primaryDark),
            ),
            ListTile(
              trailing: Icon(
                Icons.location_on,
                color: AppColors.primaryDark,
              ),
              title: Text(
                "${locationMd.locationName}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${locationMd.locationStreet},\n${locationMd.locationCity}.",
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: onEditPress,
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: onDeletePress,
                    child: Text(
                      "Remove",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
