import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      title: 'Mocci',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr'), // Turkish (default)
        Locale('en'), // English
      ],
      locale: const Locale('tr'), // Set Turkish as default
      initialRoute: '/',
      routes: {
        '/': (context) => InfoScreen(),
        '/history': (context) => FamilyHistoryScreen(),
        '/results': (context) => ResultsScreen(),
      },
    );
  }
}