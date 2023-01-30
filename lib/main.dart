import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mysyriadmin/Pages/HomePage.dart';
import 'package:mysyriadmin/constents.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shayari App Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: bgcolor,
        primaryColor: appcolor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const HomePage(),
    );
  }
}
