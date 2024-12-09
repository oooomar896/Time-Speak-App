import 'package:get/get.dart';

class SessionController extends GetxController {
  RxInt remainingTime = 1200.obs; // وقت الجلسة (20 دقيقة)
  RxBool isSessionActive = false.obs;
  RxList<Map<String, dynamic>> sessionHistory = <Map<String, dynamic>>[].obs;

  void startSession() {
    isSessionActive.value = true;
    update();
  }

  void pauseSession() {
    isSessionActive.value = false;
    update();
  }

  void endSession(String speakerName) {
    sessionHistory.add({
      'speaker': speakerName,
      'time': remainingTime.value,
      'date': DateTime.now().toString(),
    });
    isSessionActive.value = false;
    remainingTime.value = 1200; // إعادة ضبط الوقت
    update();
  }

  void decrementTime() {
    if (isSessionActive.value && remainingTime.value > 0) {
      remainingTime.value--;
    }
    if (remainingTime.value == 0) {
      Get.toNamed('/redAlert');
    }
  }
}
