import 'package:flutter/material.dart';

class RedAlertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning, color: Colors.white, size: 100),
            SizedBox(height: 20),
            Text(
              "انتهى الوقت!",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("العودة إلى الشاشة الرئيسية", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
