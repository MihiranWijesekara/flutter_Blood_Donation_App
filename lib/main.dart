import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/donor_home.dart';
import 'package:flutter_application_1/Home/organizerForm.dart';
import 'package:flutter_application_1/Home/organizer_Home.dart';
import 'package:flutter_application_1/authentication/login/login.dart';
import 'package:flutter_application_1/authentication/signup/signup.dart';
import 'package:flutter_application_1/welcome/Welcom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Blood Donation Champ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: WelcomePage2());
    home: OrganizerHomePage());
  }
}
