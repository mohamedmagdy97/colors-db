import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GlobalNotification {
  static StreamController<Map<String, dynamic>> _onMessageStreamController =
      StreamController.broadcast();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  int _id = 0;
  bool show = true;
  BuildContext _context;
  static GlobalNotification instance = new GlobalNotification._();

  GlobalNotification._();

  GlobalNotification();

  setupNotification({BuildContext context})async {
    _context = context;
    _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings("@mipmap/launcher_icon");
    var ios = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android: android, iOS: ios);
    _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onSelectNotification: flutterNotificationClick,
    );
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("_____________________Message data:${message.data}");
      print("_____________________notification:${message.notification}");
      print('Message data: ${message.data}');
      _id++;
      _showLocalNotification(message, _id);
      _onMessageStreamController.add(message.data);
      if (int.parse(message.data["type"]) == -1) {
        Utils.clearSavedData();
        ExtendedNavigator.of(context).push(Routes.login);
      }
    });
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    messaging.getToken().then((token) {
      print(token);
    });
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background message: ${message..messageId}");
    _id++;
    await Firebase.initializeApp();
    _showLocalNotification(message, _id);
  }

  StreamController<Map<String, dynamic>> get notificationSubject {
    return _onMessageStreamController;
  }

  _showLocalNotification(RemoteMessage message, id) async {
    // var provider= navigatorKey.currentContext.read<NotifyProvider>();
    // provider.setNotifyCount(provider.count+1);

    var android = AndroidNotificationDetails(
      "${DateTime.now()}",
      "${message.data["title"]}",
      "${message.data["body"]}",
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      shortcutId: "$_id",
    );
    var ios = IOSNotificationDetails();
    var _platform = NotificationDetails(android: android, iOS: ios);
    _flutterLocalNotificationsPlugin.show(
        id, "${message.data["title"]}", "${message.data["body"]}", _platform,
        payload: json.encode(message.data));
  }

  Future flutterNotificationClick(payload) async {

    print("tttttttttt $payload");

    // if (_type >= 1 && _type <= 4) {
    //   var adInfo= json.decode(_data["ads_info"]);
    //   ExtendedNavigator.root.push(Routes.productDetails,
    //       arguments: ProductDetailsArguments(model: model));
    // } else if(_type >4) {
    //   ExtendedNavigator.root.push(Routes.home);
    // }
  }
}
