import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_savvy/controller/orders_controllers/orders_details_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/orders_widgets/table_row_title_texts.dart';

class OrdersDetails extends StatelessWidget {
  static const String routeName = '/orders-details';

  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryDark,
          ),
        ),
        title: Text(
          'Orders Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<OrdersDetailsController>(
          builder: (controller) => ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Card(
                elevation: 4,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        TableTitleTexts(
                          titleText: true,
                          text: "Specs",
                        ),
                        TableTitleTexts(
                          titleText: true,
                          text: "QTY",
                        ),
                        TableTitleTexts(
                          titleText: true,
                          text: "Price",
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableTitleTexts(
                          text: "Mac M1",
                        ),
                        TableTitleTexts(
                          text: "2",
                        ),
                        TableTitleTexts(
                          text: "1989216 EGP",
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableTitleTexts(
                          text: "Mac M1",
                        ),
                        TableTitleTexts(
                          text: "2",
                        ),
                        TableTitleTexts(
                          text: "1989216 EGP",
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableTitleTexts(
                          text: "",
                        ),
                        TableTitleTexts(
                          titleText: true,
                          text: "TotalPrice: ",
                        ),
                        TableTitleTexts(
                          titleText: true,
                          text: "1989216 EGP",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                child: ListTile(
                  title: Text(
                    "Shipping Address:",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                      "${controller.ordersMd.locationCity},${controller.ordersMd.locationStreet}"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    markers: controller.markers.toSet(),
                    initialCameraPosition: controller.cameraPosition!,
                    onMapCreated: (GoogleMapController mapController) {
                      controller.completerController.complete(mapController);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
