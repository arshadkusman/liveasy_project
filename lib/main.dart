import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_project/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffffffff),
      ),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
