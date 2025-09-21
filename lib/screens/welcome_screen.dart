import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  
  const WelcomeScreen({super.key});
  

  // Burasi komple kaldirilacak

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('This is a patient health recommendation app'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/info'),
              child: Text('GET STARTED'),
            ),
          ],
        ),
      ),
    );
  }
}