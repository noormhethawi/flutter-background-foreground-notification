import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/binding/init_binding.dart';
import 'package:untitled2/firebase_options.dart';

import 'core/service/my_Services.dart';
import 'core/service/route.dart';
import 'routes.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  MyService();
  await MyService().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: 'Flutter D'
          ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: initialBindings(),
      getPages: routes,
      initialRoute: Routes.loginScreen,
      // home: const home_screen(),
    );
  }
}
