// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use, sort_child_properties_last, prefer_final_fields, avoid_print
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import 'package:untitled1/view/screen/home/controller/controller_home.dart';

class MainScreen extends StatelessWidget {
  final SessionController controller = Get.put(SessionController());
 // باستخدام GetX للحصول على HomeController
    final HomeController controller2 = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إدارة الجلسة", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: controller.showNotificationSettings,
          ),
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () => Get.to(SessionHistoryScreen()),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // قسم التحليلات
                Obx(() => Container(
                      padding: EdgeInsets.all(20),
                      child: PieChart(PieChartData(sections: controller.getChartSections())),
                    )),
                // المتحدث الحالي
                Obx(() => Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "المتحدث الحالي: ${controller.currentSpeaker.value}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
                // أزرار التحكم
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton("بدء", Colors.green, controller.startSession),
                    _buildActionButton("إيقاف", Colors.red, controller.pauseSession),
                    _buildActionButton("إنهاء", Colors.blue, controller.endSession),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: controller.startListening,
                  icon: Icon(Icons.mic),
                  label: Text("بدء الاستماع"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo, padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                ),
              ],
            ),
          ),
          // تنبيه انتهاء الوقت
          Obx(() {
            if (controller.remainingTime.value <= 30) {
              return Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.red[300],
                  child: Text(
                    "تنبيه: تبقى أقل من 30 ثانية للجلسة",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }
            return SizedBox.shrink();
          }),
        ],
      ),
    );
  }

  void sendNotification(String title, String message) async {
    FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'session_channel',
      'Session Notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: androidDetails);
    await notifications.show(0, title, message, details);
  }

  Future<void> analyzeText(String text) async {
    final response = await http.post(
      Uri.parse("https://api.textanalysis.com/sentiment"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"text": text, "language": "ar"}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("تحليل النص: ${data['sentiment']}");
      Get.snackbar("تحليل النص", "المشاعر: ${data['sentiment']}");
    } else {
      print("فشل التحليل: ${response.statusCode}");
    }
  }

  void handleVoiceCommand(String command) {
    if (command.contains("ابدأ الجلسة")) {
      controller.startSession();
    } else if (command.contains("أوقف الجلسة")) {
      controller.pauseSession();
    } else if (command.contains("أنهي الجلسة")) {
      controller.endSession();
    } else {
      Get.snackbar("أمر غير معروف", "لم أتمكن من التعرف على الأمر: $command");
    }
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

  Widget _buildStatisticsChart(Map<String, int> stats) {
    if (stats.isEmpty) {
      return Text("لا توجد بيانات لعرض الإحصاءات");
    }

    List<PieChartSectionData> sections = stats.entries
        .map((entry) => PieChartSectionData(
              color: Colors.primaries[stats.keys.toList().indexOf(entry.key) % Colors.primaries.length],
              value: entry.value.toDouble(),
              title: "${entry.key} (${entry.value} ثانية)",
              radius: 50,
            ))
        .toList();

    return PieChart(PieChartData(sections: sections));
  }
}

class SessionController extends GetxController {
  RxBool isSessionActive = false.obs;
  RxString currentSpeaker = ''.obs;
  RxInt remainingTime = 600.obs; // الجلسة مدتها الافتراضية 10 دقائق (بالثواني)
  Timer? sessionTimer;

  void startSession() {
    if (isSessionActive.value) {
      Get.snackbar("تنبيه", "الجلسة قيد التشغيل بالفعل!");
      return;
    }

    // تعيين حالة الجلسة
    isSessionActive.value = true;
    currentSpeaker.value = "اسم المتحدث الأول"; // تعديل حسب الحاجة

    // بدء مؤقت الجلسة
    sessionTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        endSession();
      }
    });

    // عرض رسالة نجاح
    Get.snackbar("بدء الجلسة", "تم بدء الجلسة بنجاح!");
  }

  void pauseSession() {
    if (!isSessionActive.value) {
      Get.snackbar("تنبيه", "لا توجد جلسة قيد التشغيل للإيقاف.");
      return;
    }

    sessionTimer?.cancel();
    isSessionActive.value = false;

    Get.snackbar("إيقاف الجلسة", "تم إيقاف الجلسة مؤقتًا.");
  }

  void endSession() {
    sessionTimer?.cancel();
    isSessionActive.value = false;
    remainingTime.value = 0;

    Get.snackbar("إنهاء الجلسة", "تم إنهاء الجلسة بنجاح.");
  }

  void showNotificationSettings() {
    // أضف هنا الكود لفتح إعدادات الإشعارات حسب حاجتك.
  }

  List<PieChartSectionData> getChartSections() {
    // يمكن تعديل هذا لتوفير بيانات فعلية للرسم البياني
    return [
      PieChartSectionData(value: 40, color: Colors.green, title: '40%'),
      PieChartSectionData(value: 30, color: Colors.blue, title: '30%'),
      PieChartSectionData(value: 20, color: Colors.red, title: '20%'),
      PieChartSectionData(value: 10, color: Colors.orange, title: '10%'),
    ];
  }

  void startListening() {
    // بدء الاستماع للأوامر الصوتية
  }
}

class SessionHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تاريخ الجلسات"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('sessions').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          var sessions = snapshot.data!.docs;
          return ListView.builder(
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              var session = sessions[index];
              return ListTile(
                title: Text("المتحدث: ${session['speaker']}"),
                subtitle: Text("المدة: ${session['timeSpent']} ثانية"),
              );
            },
          );
        },
      ),
    );
  }
}
