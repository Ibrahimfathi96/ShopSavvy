import 'package:flutter/material.dart';
import 'package:shop_savvy/core/class/status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading ?
    const Center(child: Text("loading"),) :
    statusRequest == StatusRequest.internetFailure?
    const Center(child: Text("internet Error"),):
    statusRequest == StatusRequest.serverFailure?
    const Center(child: Text("server failure"),):
    statusRequest == StatusRequest.failure?
    const Center(child: Text("There's no available data right now."),):
    widget;
  }
}
