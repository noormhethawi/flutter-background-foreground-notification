import 'package:get/get.dart';

class Home_Controller extends GetxController {
  int count = 0;

  inc() {
    count += 1;
    update();
  }

  @override
  void onInit() {
    inc();

    super.onInit();
  }
}
