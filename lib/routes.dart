import 'package:untitled2/screens/login/screen/login_screen.dart';
import 'package:untitled2/screens/notifications_screen/screen/notification_screen.dart';

import '/screens/home_screen/screen/home_screen.dart';
import '/screens/profile/screen/profile_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
 
  GetPage(
    name: "/loginScreen",
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: "/notificationScreen",
    page: () => const NotificationScreen(),
  ),

];
