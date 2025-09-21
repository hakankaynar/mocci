import 'package:flutter/material.dart';

class FamilyHistoryScreen extends StatefulWidget {

  const FamilyHistoryScreen({super.key});

  @override
  FamilyHistoryScreenState createState() => FamilyHistoryScreenState();
}

class FamilyHistoryScreenState extends State<FamilyHistoryScreen> {
  
  // Risk Faktorleri diye degistirilecek
  final List<String> _availableConditions = [
    'Diabetes',
    'Hypertension',
    'Coronary Heart Disease', 
    'Kolorektal Kanser', 
    'Meme Kanseri',
    'Prostat Kanseri',
  ];




  
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
      appBar: AppBar(title: Text('Family History')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Family History'),
            Wrap(
              spacing: 8,
              children: _availableConditions.map((condition) {
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
              child: Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }
}