import 'package:flutter/material.dart';

class MultiSessionScreen extends StatefulWidget {
  @override
  _MultiSessionScreenState createState() => _MultiSessionScreenState();
}

class _MultiSessionScreenState extends State<MultiSessionScreen> {
  List<Map<String, dynamic>> sessions = [
    {'sessionName': 'جلسة 1', 'duration': 20, 'status': 'active'},
    {'sessionName': 'جلسة 2', 'duration': 15, 'status': 'inactive'},
  ];

  // إضافة جلسة جديدة
  void addSession(String name, int duration) {
    setState(() {
      sessions.add({'sessionName': name, 'duration': duration, 'status': 'active'});
    });
  }

  // بدء أو إيقاف الجلسة
  void toggleSession(int index) {
    setState(() {
      sessions[index]['status'] = sessions[index]['status'] == 'active' ? 'inactive' : 'active';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إدارة الجلسات المتعددة")),
      body: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, index) {
          var session = sessions[index];
          return ListTile(
            title: Text(session['sessionName']),
            subtitle: Text("الوقت المتبقي: ${session['duration']} دقيقة"),
            trailing: IconButton(
              icon: Icon(session['status'] == 'active' ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                toggleSession(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addSession("جلسة جديدة", 30);  // إضافة جلسة جديدة
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
