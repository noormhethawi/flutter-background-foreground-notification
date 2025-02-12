import '/screens/home_screen/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Home_Controller());
    return Scaffold(body: Container(child: Text("${controller.count}")));
  }
}
