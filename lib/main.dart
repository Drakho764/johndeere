import 'package:coffe_18030552/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jhon Deere',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const Home(),
    );
  }
}

