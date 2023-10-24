import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/orders_controllers/checkout_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/generated/assets.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/check_bottom_button.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/check_main_texts.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/checkout_delivery_container.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/checkout_location_card.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/checkout_payment_container.dart';

class CheckOutView extends StatelessWidget {
  static const String routeName = '/check-out';

  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutController());
    return Scaffold(
      bottomNavigationBar: CheckoutBottomButton(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryDark,
          ),
        ),
        title: Text(
          'CheckOut',
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<CheckOutController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CustomCheckText(
                  text: "Payment Method",
                ),
                const SizedBox(
                  height: 10,
                ),
                //0=>cash, 1=>visa card, 2=>master card
                MethodPaymentContainer(
                  onTap: () {
                    controller.choosePaymentMethod("0");
                  },
                  isActive: controller.paymentMethod == "0" ? true : false,
                  text: "Cash",
                  imageUrl: Assets.imagesCash,
                ),
                MethodPaymentContainer(
                  onTap: () {
                    controller.choosePaymentMethod("1");
                  },
                  isActive: controller.paymentMethod == "1" ? true : false,
                  text: "Visa Card",
                  imageUrl: Assets.imagesVisaRemovebgPreview,
                ),
                MethodPaymentContainer(
                  onTap: () {
                    controller.choosePaymentMethod("2");
                  },
                  isActive: controller.paymentMethod == "2" ? true : false,
                  text: "Master Card",
                  imageUrl: Assets.imagesMasterCardRemovebgPreview,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomCheckText(
                  text: "Delivery Method",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //0=>Delivery, 1=> Drive Thru
                    MethodDeliveryContainer(
                      onTap: () {
                        controller.chooseDeliveryMethod("0");
                      },
                      isActive: controller.deliveryMethod == "0" ? true : false,
                      imageUrl: Assets.imagesDelivery,
                      text: "Delivery",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MethodDeliveryContainer(
                      onTap: () {
                        controller.chooseDeliveryMethod("1");
                      },
                      isActive: controller.deliveryMethod == "1" ? true : false,
                      imageUrl: Assets.imagesDrivethru,
                      text: "Drive Thru",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (controller.deliveryMethod == "0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCheckText(
                            text: "Shipping Location",
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToAddNewLocation();
                            },
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.primaryDark,
                              ),
                              child: Icon(
                                Icons.location_on_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      controller.locationListData.isEmpty
                          ? Container(
                              child: Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryDark,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      )),
                                  onPressed: () {
                                    controller.goToAddNewLocation();
                                  },
                                  child: Text(
                                    "add New Location",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: Get.height * 0.25,
                              child: ListView(
                                physics: BouncingScrollPhysics(),
                                children: [
                                  ...List.generate(
                                    controller.locationListData.length,
                                    (index) => CheckoutLocationCard(
                                      onTap: () {
                                        controller.chooseShippingLocation(
                                            controller.locationListData[index]
                                                .locationId
                                                .toString());
                                      },
                                      title:
                                          "${controller.locationListData[index].locationName}",
                                      subtitle:
                                          "${controller.locationListData[index].locationCity},${controller.locationListData[index].locationStreet}",
                                      isActive: controller.locationId ==
                                          controller.locationListData[index]
                                              .locationId
                                              .toString(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
