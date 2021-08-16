import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString status = "online".obs;
  RxString email = "".obs;

  @override
  void onInit() {
    super.onInit();

    ever(status, (_) {
      Get.snackbar("Status", "Atualizaro");
    });
  }

  void updateStatus(String newStatus) {
    status.value = newStatus;
  }

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }
}
