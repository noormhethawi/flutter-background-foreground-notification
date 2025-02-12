import 'package:get/get.dart';
import 'package:untitled2/core/constData/app_colors.dart';

import '/screens/notifications_screen/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (controller) {
              return Scaffold(
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 80,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Notification Page",
                          style: TextStyle(
                            color: ColorPallete.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 33,
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        InkWell(
                          onTap: () {
                            controller.sendNotification();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorPallete.btnColor,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: double.infinity,
                            height: 50,
                            child: Center(
                              child: controller.isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Receive Notification",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorPallete.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(() => Expanded(
                              child: ListView.builder(
                                itemCount: controller.notificationsList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                        controller.notificationsList[index]),
                                  );
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
