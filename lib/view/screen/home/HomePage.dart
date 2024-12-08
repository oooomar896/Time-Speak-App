import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("العد التنازلي للجلسة", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 30),
            _buildCountdownTimer(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton("بدء الجلسة", Colors.green),
                SizedBox(width: 20),
                _buildActionButton("إيقاف مؤقت", Colors.orange),
                SizedBox(width: 20),
                _buildActionButton("إنهاء", Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountdownTimer() {
    return CircularProgressIndicator(
      value: 0.5, // قيمة توضح التقدم (من 0 إلى 1)
      backgroundColor: Colors.grey[300],
      valueColor: AlwaysStoppedAnimation(Colors.green),
      strokeWidth: 8,
    );
  }

  Widget _buildActionButton(String label, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14, horizontal: 30)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
      child: Text(label, style: TextStyle(fontSize: 18)),
    );
  }
}
