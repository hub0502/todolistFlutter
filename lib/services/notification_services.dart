import 'dart:js';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_todolist/ui/home_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  initializeNotification() async {
    // tz.initializeTimeZones();
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(
      context as BuildContext,
      MaterialPageRoute<void>(
          builder: (context) => Container(color: Colors.white)),
    );
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    // showDialog(
    // context: context,
    // builder: (BuildContext context) => CupertinoAlertDialog(
    //   title: Text(title),
    //   content: Text(body),
    //   actions: [
    //     CupertinoDialogAction(
    //       isDefaultAction: true,
    //       child: Text('Ok'),
    //       onPressed: () async {
    //         Navigator.of(context, rootNavigator: true).pop();
    //         await Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => SecondScreen(payload),
    //           ),
    //         );
    //       },
    //     )
    //   ],
    // ),
    // );
    Get.dialog(Text("Welcome to flutter"));
  }
}
