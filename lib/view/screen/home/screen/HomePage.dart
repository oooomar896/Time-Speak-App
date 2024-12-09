// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use, sort_child_properties_last, prefer_final_fields, avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/view/screen/home/screen/redPage.dart';
import 'package:untitled1/view/screen/home/screen/sessition.dart';
import 'package:untitled1/view/screen/home/screen/setting.dart';

class MainScreen extends StatelessWidget {
  final SessionController controller = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("العد التنازلي للجلسة", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.to(() => SettingsScreen());
            },
          ),
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Get.to(() => SessionHistoryScreen());
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              "المتحدث الحالي: ${controller.currentSpeaker}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            )),
            SizedBox(height: 30),
            Obx(() => CircularProgressIndicator(
              value: controller.remainingTime.value / controller.totalTime.value,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(Colors.green),
              strokeWidth: 8,
            )),
            SizedBox(height: 20),
            Obx(() => Text(
              "الوقت المتبقي: ${controller.remainingTime.value ~/ 60}:${controller.remainingTime.value % 60}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            )),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton("بدء الجلسة", Colors.green, controller.startSession),
                SizedBox(width: 20),
                _buildActionButton("إيقاف مؤقت", Colors.orange, controller.pauseSession),
                SizedBox(width: 20),
                _buildActionButton("إنهاء", Colors.red, controller.endSession),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.startListening,
        child: Icon(Icons.mic),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildActionButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14, horizontal: 30)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        elevation: MaterialStateProperty.all(5),
      ),
      child: Text(label, style: TextStyle(fontSize: 15, color: Colors.white)),
    );
  }
}

class SessionController extends GetxController {
  RxInt remainingTime = 1200.obs;
  RxInt totalTime = 1200.obs;
  RxString currentSpeaker = "غير معروف".obs;
  RxBool isRunning = false.obs;
  RxBool isPaused = false.obs;
  RxString speakerStatus = "غير متاح".obs;
  SpeechToText _speechToText = SpeechToText();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    _initializeNotifications();
    fetchSpeakerStatus(); // جلب حالة المتحدث من الـ API عند تحميل الصفحة
  }

  void _initializeNotifications() {
    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _showNotification(String title, String body) async {
    var androidDetails = AndroidNotificationDetails(
      'channel_id', 'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    var notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0, title, body, notificationDetails,
      payload: 'session_end',
    );
  }

  void startSession() {
    if (!isRunning.value) {
      isRunning.value = true;
      isPaused.value = false;
      _showNotification("بدء الجلسة", "تم بدء الجلسة بنجاح.");
      _startTimer();
    }
  }

  void pauseSession() {
    if (isRunning.value && !isPaused.value) {
      isPaused.value = true;
      _showNotification("إيقاف الجلسة", "تم إيقاف الجلسة مؤقتًا.");
    } else if (isRunning.value && isPaused.value) {
      isPaused.value = false;
      _showNotification("استئناف الجلسة", "تم استئناف الجلسة.");
      _startTimer();
    }
  }

  void endSession() {
    isRunning.value = false;
    saveSession(currentSpeaker.value, totalTime.value - remainingTime.value);
    remainingTime.value = totalTime.value;
    _showNotification("انتهت الجلسة", "تم إنهاء الجلسة بنجاح.");
    Get.to(() => RedAlertScreen());
  }

  void _startTimer() async {
    while (isRunning.value && remainingTime.value > 0) {
      if (isPaused.value) {
        break;
      }
      await Future.delayed(Duration(seconds: 1));
      remainingTime.value--;
      if (remainingTime.value == 0) {
        endSession();
      }
    }
  }

  void startListening() async {
    bool available = await _speechToText.initialize();
    if (available) {
      _speechToText.listen(onResult: (result) {
        currentSpeaker.value = result.recognizedWords.isNotEmpty ? result.recognizedWords : "غير معروف";
        fetchSpeakerStatus(); // تحديث حالة المتحدث مع كل كلمة تم التعرف عليها
        analyzeSpeech(result.recognizedWords); // تحليل النص باستخدام API
      });
    }
  }

  void stopListening() {
    _speechToText.stop();
  }

  // Fetch speaker status from API
  Future<void> fetchSpeakerStatus() async {
    try {
      final response = await http.get(Uri.parse('https://api.example.com/getSpeakerStatus?name=${currentSpeaker.value}'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        speakerStatus.value = data['status']; // تحديث حالة المتحدث
      } else {
        speakerStatus.value = "غير متاح";
      }
    } catch (e) {
      speakerStatus.value = "غير متاح";
    }
  }

  // Analyze Speech using an NLP API
  Future<void> analyzeSpeech(String speechText) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.example.com/analyzeSpeech'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'text': speechText}),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // تحليل النص حسب الكلمات الرئيسية، أو النوايا
        print("تحليل النص: ${data['analysis']}");
      } else {
        print("فشل تحليل النص");
      }
    } catch (e) {
      print("خطأ في تحليل النص: $e");
    }
  }
}


// Save Session to Firebase
// Save Session to Firebase
void saveSession(String speakerName, int timeSpent) async {
  await FirebaseFirestore.instance.collection('sessions').add({
    'speaker': speakerName,
    'timeSpent': timeSpent,
    'date': Timestamp.now(),
  });
}


// Red Alert Screen
// Red Alert Screen

