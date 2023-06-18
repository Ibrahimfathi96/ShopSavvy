import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/location/add_location_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/functions/valid_input.dart';
import 'package:shop_savvy/view/widget/auth_widgets/custom_text_form_field.dart';

class AddLocationBottomSheet extends GetView<AddLocationController> {
  const AddLocationBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HandlingDataView(
      statusRequest: controller.statusRequest,
      widget: Container(
        height: Get.height * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Complete your Info",
                  style: TextStyle(fontSize: 20, color: AppColors.primaryDark),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomAuthTextFormField(
                hintText: "enter your city",
                labelText: "City",
                iconData: FontAwesomeIcons.city,
                controller: controller.cityController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  return validInput(val!, 5, 100, "City");
                },
              ),
              CustomAuthTextFormField(
                hintText: "enter your street",
                labelText: "Street",
                iconData: FontAwesomeIcons.streetView,
                controller: controller.streetController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  return validInput(val!, 5, 100, "Street");
                },
              ),
              CustomAuthTextFormField(
                hintText: "enter location name",
                labelText: "Name",
                iconData: Icons.drive_file_rename_outline,
                controller: controller.nameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                validator: (val) {
                  return validInput(val!, 6, 100, "Name");
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: Size(50, Get.height * 0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  controller.addLocation();
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
