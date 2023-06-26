import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    debugPrint("=============FCM============");
    debugPrint(remoteMessage.notification!.title);
    debugPrint(remoteMessage.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(
        remoteMessage.notification!.title!, remoteMessage.notification!.body!);
  });
}
