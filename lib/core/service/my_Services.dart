//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyService extends GetxService {
  late GetStorage storage;

  Future<MyService> init() async {
    await GetStorage.init();  // Initialize GetStorage
    storage = GetStorage();   // Create an instance of GetStorage
    return this;
  }

  // Example methods to read and write from GetStorage
  void saveData(String key, dynamic value) {
    storage.write(key, value);
  }

  dynamic readData(String key) {
    return storage.read(key);
  }


  //  Future<MyServices> initializeNotifications() async {
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');
  //   const InitializationSettings initializationSettings =
  //       InitializationSettings(
  //     android: initializationSettingsAndroid,
  //   );
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //   return this;
  // }

}

initialService() async {
  await Get.putAsync(() => MyService().init());
}