import 'package:flutter/material.dart';
import 'screens/info_screen.dart';
import 'screens/family_history_screen.dart';
import 'screens/results_screen.dart';

void main() {
  runApp(PatientHealthApp());
}

class PatientHealthApp extends StatelessWidget {

  const PatientHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient Health App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InfoScreen(),
        '/history': (context) => FamilyHistoryScreen(),
        '/results': (context) => ResultsScreen(),
      },
    );
  }
}