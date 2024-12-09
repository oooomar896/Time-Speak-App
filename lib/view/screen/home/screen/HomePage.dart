// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/view/screen/home/setting.dart';

import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:fl_chart/fl_chart.dart';
class MainScreen extends StatelessWidget {
  final SessionController controller = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إدارة الجلسة"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Get.to(() => SettingsScreen()),
          ),
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () => Get.to(() => SessionHistoryScreen()),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.speakers.length,
                itemBuilder: (context, index) {
                  final speaker = controller.speakers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: speaker.color,
                      child: Text(
                        speaker.name[0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(speaker.name),
                    subtitle: Text(
                        "الوقت المتبقي: ${speaker.remainingTime ~/ 60}:${speaker.remainingTime % 60}"),
                    trailing: IconButton(
                      icon: Icon(Icons.play_arrow),
                      onPressed: () => controller.startSpeakerTimer(index),
                    ),
                  );
                },
              );
            }),
          ),
          _buildSessionControls(),
        ],
      ),
    );
  }

  Widget _buildSessionControls() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: controller.startSession,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text("بدء الجلسة"),
          ),
          ElevatedButton(
            onPressed: controller.pauseSession,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: Text("إيقاف مؤقت"),
          ),
          ElevatedButton(
            onPressed: controller.endSession,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text("إنهاء الجلسة"),
          ),
        ],
      ),
    );
  }
}

// إدارة الجلسة
class SessionController extends GetxController {
  RxList<Speaker> speakers = <Speaker>[
    Speaker("متحدث 1", Colors.blue, 300),
    Speaker("متحدث 2", Colors.green, 300),
    Speaker("متحدث 3", Colors.red, 300),
  ].obs;

  RxBool isRunning = false.obs;

  void startSession() {
    isRunning.value = true;
    for (var speaker in speakers) {
      speaker.remainingTime.value = speaker.totalTime;
    }
  }

  void pauseSession() {
    isRunning.value = false;
  }

  void endSession() {
    isRunning.value = false;
    Get.to(() => SummaryScreen());
  }

 void startSpeakerTimer(int index) {
  if (isRunning.value) {
    for (var speaker in speakers) {
      speaker.isActive.value = false;
    }
    speakers[index].isActive.value = true;

    Future.delayed(Duration(seconds: speakers[index].remainingTime.value), () {
      if (speakers[index].isActive.value) {
        FlutterLocalNotificationsPlugin().show(
          0,
          'تنبيه',
          'انتهى وقت ${speakers[index].name}',
          NotificationDetails(
            android: AndroidNotificationDetails('channel_id', 'channel_name'),
          ),
        );
      }
    });
  }
}

}

// نموذج المتحدث
class Speaker {
  String name;
  Color color;
  int totalTime;
  RxInt remainingTime = 0.obs;
  RxBool isActive = false.obs;

  Speaker(this.name, this.color, this.totalTime);
}

// شاشة الإعدادات
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الإعدادات")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("الإعدادات", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text("ضبط الحد الأقصى للوقت لكل متحدث"),
            Slider(
              value: 300,
              min: 60,
              max: 1200,
              divisions: 20,
              label: "300 ثانية",
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text("الإشعارات قبل انتهاء الوقت"),
              value: true,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

// شاشة السجل
class SessionHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("سجل الجلسات")),
      body: Center(child: Text("لا توجد جلسات مسجلة")),
    );
  }
}

// شاشة التلخيص
class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ملخص الجلسة")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "ملخص الجلسة",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 300, // القيمة الصحيحة
                          color: Colors.blue,
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 200, // القيمة الصحيحة
                          color:Colors.green,
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 100, // القيمة الصحيحة
                          color:Colors.red,
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                  ],
                  titlesData: FlTitlesData(
  leftTitles: AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 40,
      getTitlesWidget: (value, meta) {
        return Text(
          value.toInt().toString(),
          style: TextStyle(color: Colors.black, fontSize: 12),
        );
      },
    ),
  ),
  bottomTitles: AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 40,
      getTitlesWidget: (value, meta) {
        switch (value.toInt()) {
          case 0:
            return Text('متحدث 1', style: TextStyle(color: Colors.black));
          case 1:
            return Text('متحدث 2', style: TextStyle(color: Colors.black));
          case 2:
            return Text('متحدث 3', style: TextStyle(color: Colors.black));
          default:
            return Text('');
        }
      },
    ),
  ),
),
                  borderData: FlBorderData(show: true),
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
