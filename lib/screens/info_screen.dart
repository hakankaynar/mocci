import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {

  const InfoScreen({super.key});
  
  @override
  InfoScreenState createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _sex = 'Male';


  // herbirinin randevusu farkli olacak
  final List<String> _availableIllnesses = [
  'Diabetes', // Serker
  'Hypertension', // Tansiyon
  'Coronary Heart Disease', // Koroner kalp hastaligi
  'Inflamatuar bagirsak hastaligi',
  'Hipotroid', 
  'Hipertroid',
  'Koah',
  'Bobrek Yetmezligi',
  'Siroz',
  ];





final List<String> _selectedIllnesses = [];

void _toggleIllness(String illness) {
  setState(() {
    if (_selectedIllnesses.contains(illness)) {
      _selectedIllnesses.remove(illness);
    } else {
      _selectedIllnesses.add(illness);
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Buraya boy kilo diye eklenecek
      appBar: AppBar(title: Text('Enter your information')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name Surname'),
              ),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              // TODO boy kilo eklenecek
             
              ListTile(
                title: Text('Male'),
                leading: Radio(
                  value: 'Male',
                  groupValue: _sex,
                  onChanged: (value) => setState(() => _sex = value!),
                ),
              ),
              ListTile(
                title: Text('Female'),
                leading: Radio(
                  value: 'Female',
                  groupValue: _sex,
                  onChanged: (value) => setState(() => _sex = value!),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // burasi sonraki ekrana gidecek
                    Text('Kronik hastaliklar'), // Kronik hastaliklar
                    Wrap(
                      spacing: 8,
                      children: _availableIllnesses.map((illness) {
                        final selected = _selectedIllnesses.contains(illness);
                        return FilterChip(
                          label: Text(illness),
                          selected: selected,
                          onSelected: (_) => _toggleIllness(illness),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/history'),
                  child: Text('NEXT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}