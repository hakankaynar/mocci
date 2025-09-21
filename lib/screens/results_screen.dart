import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {

  const ResultsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final List<String> history =
        ModalRoute.of(context)?.settings.arguments as List<String>;

    final List<String> recommendations = [];
    if (history.contains('Diabetes')) {
      recommendations.add('Quarterly Test for Diabetes');
    }
    if (history.contains('Coronary Heart Disease')) {
      recommendations.add('Yearly Test for Coronary Heart Disease');
    }

    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recommended tests:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...recommendations.map((test) => Text('• $test')),
          ],
        ),
      ),
    );
  }
}