import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoScreen extends StatefulWidget {

  const InfoScreen({super.key});
  
  @override
  InfoScreenState createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _sex = 'Male';


  // herbirinin randevusu farkli olacak

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Buraya boy kilo diye eklenecek
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.enterYourInformation)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.nameSurname),
              ),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.age),
              ),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.height),
              ),
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.weight),
              ),
             
              ListTile(
                title: Text(AppLocalizations.of(context)!.male),
                leading: Radio(
                  value: 'Male',
                  groupValue: _sex,
                  onChanged: (value) => setState(() => _sex = value!),
                ),
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.female),
                leading: Radio(
                  value: 'Female',
                  groupValue: _sex,
                  onChanged: (value) => setState(() => _sex = value!),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/history'),
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