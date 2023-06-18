import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_savvy/controller/location/add_location_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/view/widget/location_widgets/floating_action_button.dart';

class AddLocation extends StatelessWidget {
  static const String routeName = '/location-add';

  const AddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddLocationController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AddLocationFAButton(),
      appBar: AppBar(
        title: Text("Add New Location"),
      ),
      body: Container(
        child: GetBuilder<AddLocationController>(
          builder: (locationController) {
            return HandlingDataView(
              statusRequest: locationController.statusRequest,
              widget: Column(
                children: [
                  if (locationController.kGooglePlex != null)
                    Expanded(
                      child: GoogleMap(
                        mapType: MapType.hybrid,
                        markers: locationController.markers.toSet(),
                        onTap: (latLng) {
                          locationController.addMarkers(latLng);
                        },
                        initialCameraPosition: locationController.kGooglePlex!,
                        onMapCreated: (GoogleMapController mapController) {
                          locationController.completerController
                              .complete(mapController);
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}