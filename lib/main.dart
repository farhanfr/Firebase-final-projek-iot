import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_firebase_iot/pages/home/home_page.dart';
import 'package:test_firebase_iot/pages/sign_in_page.dart';
import 'package:test_firebase_iot/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Smart Trolley App', routes: {
      '/': (context) => SplashPage(),
      '/main': (context) => SignInPage(),
    });
  }
}
