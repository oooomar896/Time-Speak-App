import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdvancedSpeechAnalysisScreen extends StatefulWidget {
  @override
  _AdvancedSpeechAnalysisScreenState createState() =>
      _AdvancedSpeechAnalysisScreenState();
}

class _AdvancedSpeechAnalysisScreenState
    extends State<AdvancedSpeechAnalysisScreen> {
  String _emotionResult = "انتظر لتحليل الصوت...";
  String _keywords = "لا توجد كلمات رئيسية حتى الآن.";

  // إرسال الصوت إلى API لتحليل العاطفة والكلمات الرئيسية
  Future<void> analyzeEmotionAndKeywords(String audioFilePath) async {
    final url = Uri.parse('https://api.speech-analysis.com/analyze');
    final response = await http.post(
      url,
      body: json.encode({'audio': audioFilePath}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        _emotionResult = data['emotion']; // عرض العاطفة
        _keywords = data['keywords'].join(', '); // عرض الكلمات الرئيسية
      });
    } else {
      setState(() {
        _emotionResult = "فشل التحليل.";
        _keywords = "لا توجد كلمات رئيسية.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("التحليل الصوتي المتقدم")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("نتائج تحليل العاطفة: $_emotionResult"),
            SizedBox(height: 10),
            Text("الكلمات الرئيسية: $_keywords"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                analyzeEmotionAndKeywords(
                    "path/to/audio/file.wav"); // تحليل الصوت
              },
              child: Text("ابدأ التحليل المتقدم"),
            ),
          ],
        ),
      ),
    );
  }
}
