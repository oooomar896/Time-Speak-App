import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SessionHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("سجل الجلسات"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // إعادة تحميل البيانات
              // هذه الطريقة ستقوم بإعادة تحميل البيانات من Firestore
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('sessions')
              .orderBy('date', descending: true) // ترتيب الجلسات حسب التاريخ
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            var sessions = snapshot.data!.docs;
            return ListView.builder(
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                var session = sessions[index];
                var speaker = session['speaker'] ?? 'غير معروف';
                var timeSpent = session['timeSpent'] ?? 0;
                var date = (session['date'] as Timestamp).toDate();

                // حساب الوقت المستهلك
                var minutes = timeSpent ~/ 60;
                var seconds = timeSpent % 60;

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      "المتحدث: $speaker",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "الوقت المستهلك: $minutes دقيقة و $seconds ثانية\n" +
                      "التاريخ: ${date.day}-${date.month}-${date.year} في ${date.hour}:${date.minute}",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Icon(Icons.access_time),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
