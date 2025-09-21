import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FamilyHistoryScreen extends StatefulWidget {

  const FamilyHistoryScreen({super.key});

  @override
  FamilyHistoryScreenState createState() => FamilyHistoryScreenState();
}

class FamilyHistoryScreenState extends State<FamilyHistoryScreen> {
  
  // Risk Faktorleri diye degistirilecek
  List<String> _getAvailableConditions(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.diabetes,
      l10n.hypertension,
      l10n.coronaryHeartDisease,
      l10n.colorectalCancer,
      l10n.breastCancer,
      l10n.prostateCancer,
    ];
  }




  
  final List<String> _selectedConditions = [];

  void _toggleCondition(String condition) {
    setState(() {
      if (_selectedConditions.contains(condition)) {
        _selectedConditions.remove(condition);
      } else {
        _selectedConditions.add(condition);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.familyHistory)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.addFamilyHistory),
            Wrap(
              spacing: 8,
              children: _getAvailableConditions(context).map((condition) {
                final selected = _selectedConditions.contains(condition);
                return FilterChip(
                  label: Text(condition),
                  selected: selected,
                  onSelected: (_) => _toggleCondition(condition),
                );
              }).toList(),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/results',
                arguments: _selectedConditions,
              ),
              child: Text(AppLocalizations.of(context)!.next),
            ),
          ],
        ),
      ),
    );
  }
}