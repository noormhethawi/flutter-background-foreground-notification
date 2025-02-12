import '/core/class/crud.dart';
import '/screens/home_screen/controller/home_controller.dart';
import '/screens/notifications_screen/controller/notification_controller.dart';
import 'package:get/get.dart';

class initialBindings extends Bindings {
  @override
  void dependencies() {
    //
    // Get.put(Home_Controller());
    // Get.put(profile_Controller());
    Get.put(Crud());
    Get.put(Home_Controller());
   // Get.put(NotificationController());
  }
}
