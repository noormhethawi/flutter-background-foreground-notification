import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/screens/notifications_screen/screen/notification_screen.dart';
import '../../../core/service/firebase/firebase_services.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  bool obscure = true;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //for password text obscure property
  obscureFunc() {
    obscure = !obscure;
    update();
  }

  //email validate
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.endsWith('@gmail.com')) {
      return 'Your email should end with "@gmail.com"';
    }
    return null;
  }

  //password validate
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return "your password should be 8 characters or more";
    }
    return null;
  }

  //signIn function which it call when i click on sign in button
  signIn() async {
    isLoading = true;
    update();
    formState.currentState!.save();
    if (formState.currentState!.validate()) {
      String res = await FirebaseServices().signInUser(
        email: emailController.text,
        password: passwordController.text,
      );
      if (res == "Success") {
        Get.to(() => const NotificationScreen());
      } else {
        Get.snackbar("Error", res);
      }
    }
    isLoading = false;
    update();
  }
}
