

import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class notification{

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void requestnotificationpermession() async{
    NotificationSettings settings = await messaging.requestPermission(
             alert: true,
            announcement: true,
            badge: true,
            carPlay: true,
            criticalAlert: true,
            sound: true
        );
    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      print('user granted permession');
    }
    else if(settings.authorizationStatus==AuthorizationStatus.provisional){
      print('user granted provessional permession');
    }
    else{
      print('user denied');
    }

  }

  Future<String> gettoken()async{
  String? token = await messaging.getToken();

  return  token!;

  }
  void istokenrefresh(){
    messaging.onTokenRefresh.listen((event) {

      event.toString();
      print('token refresh');
    });

  }


void initlocalnotification(BuildContext context,RemoteMessage message) async{
    var androidinitilization = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosinitilizationsetting = const  DarwinInitializationSettings();

var initlizationsetting = InitializationSettings(
  android: androidinitilization,
  iOS: iosinitilizationsetting,

);
await flutterLocalNotificationsPlugin.initialize(
    initlizationsetting,
  onDidReceiveNotificationResponse:(payload){

  }

);
  }

  void firebaseinit(){
    FirebaseMessaging.onMessage.listen((message) {

      if(kDebugMode){
        print(message.notification!.title?.toString());
        print(message.notification!.body?.toString());
      }
      shownotification(message);

    });
  }

  Future<void> shownotification(RemoteMessage message) async{

    AndroidNotificationChannel channel = await  AndroidNotificationChannel(
      '1',
      // Random.secure().nextInt(10000).toString(),
      'hello this is me',
      importance:Importance.max ,
    );

    AndroidNotificationDetails androiddetails =  AndroidNotificationDetails(
 channel.id.toString(),
channel.name.toString(),
      channelDescription: 'hello this is ',
      importance: Importance.high,
      ticker: 'ticker',
      icon: "@mipmap/ic_launcher"

);
    DarwinNotificationDetails iosdetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

NotificationDetails notificationdetails = NotificationDetails(
  android: androiddetails,
  iOS: iosdetails,


);

 Future.delayed(Duration.zero,(){
      flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title?.toString(),
          message.notification!.body?.toString(),

          notificationdetails,

      );
 }
    );

}
  }