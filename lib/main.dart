
import 'package:apiget/future.dart';
import 'package:apiget/futureclass.dart';
import 'package:apiget/notification_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/cartprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage((firebasebackgroundnotificationhandler)


  );
  runApp(const MyApp());
}
@pragma('vm entery point')
Future<void> firebasebackgroundnotificationhandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  print(message.notification!.body.toString());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  notification notificationservices = notification();
  @override

  void initState() {
    notificationservices.firebaseinit(context);
    notificationservices.requestnotificationpermession();
    notificationservices.getinitialmessage(context);
    notificationservices.gettoken().then((value){
      print('token');
      print(value);
notificationservices.istokenrefresh();
    }


    );

    // TODO: implement initState
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    notification notificationservices = notification();

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>futureclass(),),
      ChangeNotifierProvider(create:(_)=>cartprovider() ),

    ] ,
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      home: future(),


    )
    );


  }
}

