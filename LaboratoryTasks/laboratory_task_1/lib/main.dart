import 'package:flutter/material.dart';
import 'package:laboratory_task_1/screens/details.dart';
import 'package:laboratory_task_1/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: 'Распоред за испити - 223008'),
        "/details": (context) => const DetailsPage(),
      },
    );
  }
}