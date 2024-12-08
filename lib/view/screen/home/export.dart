import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ExportSessionReportScreen extends StatelessWidget {
  // إنشاء تقرير CSV
  Future<void> exportToCSV(List<Map<String, dynamic>> sessions) async {
    List<List<dynamic>> rows = [];
    rows.add(["اسم الجلسة", "الوقت المتبقي", "الحالة"]);

    sessions.forEach((session) {
      rows.add([session['sessionName'], session['duration'], session['status']]);
    });

    String csv = const ListToCsvConverter().convert(rows);

    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    File file = File('$path/sessions_report.csv');
    await file.writeAsString(csv);
    print("تم تصدير التقرير إلى: $path/sessions_report.csv");
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sessions = [
      {'sessionName': 'جلسة 1', 'duration': 20, 'status': 'active'},
      {'sessionName': 'جلسة 2', 'duration': 15, 'status': 'inactive'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text("تصدير تقرير الجلسات")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            exportToCSV(sessions);  // تصدير الجلسات
          },
          child: Text("تصدير التقرير"),
        ),
      ),
    );
  }
}
