import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyAppStateless extends StatelessWidget{
  const MyAppStateless({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    ) ;
  }
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Мојa првa Flutter App 🚀'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Бројач:',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: const Text('Зголеми'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                },
                child: const Text('Ресетирај'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

