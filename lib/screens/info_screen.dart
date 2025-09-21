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
  String _sex = 'Male';


  // herbirinin randevusu farkli olacak
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
              // TODO boy kilo eklenecek
             
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
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // burasi sonraki ekrana gidecek
                    Text(AppLocalizations.of(context)!.chronicDiseases),
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
                  ],
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