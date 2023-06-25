import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/checkout_controller.dart';
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
                  text: "Choose Payment Method",
                ),
                const SizedBox(
                  height: 10,
                ),
                MethodPaymentContainer(
                  onTap: () {
                    controller.choosePaymentMethod("Cash");
                  },
                  isActive: controller.paymentMethod == "Cash" ? true : false,
                  text: "Cash",
                  imageUrl: Assets.imagesCash,
                ),
                MethodPaymentContainer(
                  onTap: () {
                    controller.choosePaymentMethod("Visa Card");
                  },
                  isActive:
                      controller.paymentMethod == "Visa Card" ? true : false,
                  text: "Visa Card",
                  imageUrl: Assets.imagesVisaRemovebgPreview,
                ),
                MethodPaymentContainer(
                  onTap: () {
                    controller.choosePaymentMethod("Master Card");
                  },
                  isActive:
                      controller.paymentMethod == "Master Card" ? true : false,
                  text: "Master Card",
                  imageUrl: Assets.imagesMasterCardRemovebgPreview,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomCheckText(
                  text: "Choose Delivery Method",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MethodDeliveryContainer(
                      onTap: () {
                        controller.chooseDeliveryMethod("Delivery");
                      },
                      isActive: controller.deliveryMethod == "Delivery"
                          ? true
                          : false,
                      imageUrl: Assets.imagesDelivery,
                      text: "Delivery",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MethodDeliveryContainer(
                      onTap: () {
                        controller.chooseDeliveryMethod("Drive Thru");
                      },
                      isActive: controller.deliveryMethod == "Drive Thru"
                          ? true
                          : false,
                      imageUrl: Assets.imagesDrivethru,
                      text: "Drive Thru",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (controller.deliveryMethod == "Delivery")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCheckText(
                        text: "Choose Shipping Location",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: Get.height * 0.3,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            ...List.generate(
                              controller.locationListData.length,
                              (index) => CheckoutLocationCard(
                                onTap: () {
                                  controller.chooseShippingLocation(controller
                                      .locationListData[index].locationId.toString());
                                },
                                title:
                                    "${controller.locationListData[index].locationName}",
                                subtitle:
                                    "${controller.locationListData[index].locationCity},${controller.locationListData[index].locationStreet}",
                                isActive: controller.locationId ==
                                        controller.locationListData[index].locationId
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
