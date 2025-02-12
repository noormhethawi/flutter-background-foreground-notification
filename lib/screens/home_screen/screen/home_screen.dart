import '/screens/notifications_screen/screen/notification_screen.dart';

import '/screens/home_screen/controller/home_controller.dart';
import '/screens/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});
  // final Home_Controller controller =
  // Get.put(Home_Controller(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: Home_Controller(),
          builder: (controller) {
            return Center(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.blueAccent,
                    child: Center(child: Text("${controller.count}")),
                  ),
                  InkWell(
                    onTap: () {
                      //Home_Controller.inc();
                      Get.off(const profile_screen());
                    },
                    child: Container(
                      height: 20,
                      width: 200,
                      color: Colors.red,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(NotificationScreen());
                      },
                      child: const Text('move it '))
                ],
              ),
            );
          }),
    );
  }
}
