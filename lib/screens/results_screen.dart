import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultsScreen extends StatelessWidget {

  const ResultsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<String> history =
        ModalRoute.of(context)?.settings.arguments as List<String>;

    final List<String> recommendations = [];
    if (history.contains(l10n.diabetes)) {
      recommendations.add(l10n.quarterlyTestForDiabetes);
    }
    if (history.contains(l10n.coronaryHeartDisease)) {
      recommendations.add(l10n.yearlyTestForCoronaryHeartDisease);
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.results)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.recommendedTests,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...recommendations.map((test) => Text('• $test')),
          ],
        ),
      ),
    );
  }
}