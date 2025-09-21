import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FamilyHistoryScreen extends StatefulWidget {

  const FamilyHistoryScreen({super.key});

  @override
  FamilyHistoryScreenState createState() => FamilyHistoryScreenState();
}

class FamilyHistoryScreenState extends State<FamilyHistoryScreen> {

  // Chronic illnesses (personal)
  List<String> _getAvailableIllnesses(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.diabetes,
      l10n.hypertension,
      l10n.coronaryHeartDisease,
      l10n.inflammatoryBowelDisease,
      l10n.hypothyroid,
      l10n.hyperthyroid,
      l10n.copd,
      l10n.kidneyFailure,
      l10n.cirrhosis,
    ];
  }

  // Family history conditions
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

  final List<String> _selectedIllnesses = [];
  final List<String> _selectedConditions = [];

  void _toggleIllness(String illness) {
    setState(() {
      if (_selectedIllnesses.contains(illness)) {
        _selectedIllnesses.remove(illness);
      } else {
        _selectedIllnesses.add(illness);
      }
    });
  }

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chronic Illnesses Section
              Text(
                AppLocalizations.of(context)!.chronicDiseases,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _getAvailableIllnesses(context).map((illness) {
                  final selected = _selectedIllnesses.contains(illness);
                  return FilterChip(
                    label: Text(illness),
                    selected: selected,
                    onSelected: (_) => _toggleIllness(illness),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),

              // Family History Section
              Text(
                AppLocalizations.of(context)!.addFamilyHistory,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
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
              SizedBox(height: 32),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Combine both selected illnesses and family conditions
                    final allSelected = [..._selectedIllnesses, ..._selectedConditions];
                    Navigator.pushNamed(
                      context,
                      '/results',
                      arguments: allSelected,
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.next),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}