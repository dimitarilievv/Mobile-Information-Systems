import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/exam_model.dart';
import '../widgets/exam_grid.dart';
import 'package:intl/intl.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Exam> _exam;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExamList();
  }

  @override
  Widget build(BuildContext context) {
    final total = _isLoading ? 0 : _exam.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(12),
        child: ExamGrid(exam: _exam),
      ),
      bottomNavigationBar: Container(
        color: Colors.teal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Вкупно испити:', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Chip(
              label: Text('$total', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: Colors.black26,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            )
          ],
        ),
      ),
    );
  }

  void _loadExamList() async{
    List<Exam> examList = [];
    examList.add(Exam(id:1, name: 'Дискретна математика', dateTime: DateTime.parse('2025-09-20T09:00:00'), rooms: ['Просторија 215', 'АМФ ФИНКИ Г']));
    examList.add(Exam(id:2, name: 'Структурно програмирање', dateTime: DateTime.parse('2025-10-05T14:00:00'), rooms: ['Просторија 138']));
    examList.add(Exam(id:3, name: 'Објектно програмирање', dateTime: DateTime.parse('2025-10-15T10:00:00'), rooms: ['Просторија 315', 'АМФ ФИНКИ М']));
    examList.add(Exam(id:4, name: 'Бази на податоци', dateTime: DateTime.parse('2025-11-05T12:00:00'), rooms: ['Просторија 138']));
    examList.add(Exam(id:5, name: 'Мобилни информациски системи', dateTime: DateTime.parse('2025-11-01T08:30:00'), rooms: ['Просторија 215']));
    examList.add(Exam(id:6, name: 'Оперативни системи', dateTime: DateTime.parse('2025-11-12T09:00:00'), rooms: ['АМФ МФ']));
    examList.add(Exam(id:7, name: 'Мрежи', dateTime: DateTime.parse('2025-11-20T15:00:00'), rooms: ['АМФ МФ']));
    examList.add(Exam(id:8, name: 'Алгоритми', dateTime: DateTime.parse('2025-12-01T11:00:00'), rooms: ['Просторија 215']));
    examList.add(Exam(id:9, name: 'Компјутерска архитектура', dateTime: DateTime.parse('2025-12-10T13:00:00'), rooms: ['Просторија 215']));
    examList.add(Exam(id:10, name: 'Софтверско инженерство', dateTime: DateTime.parse('2026-01-08T10:00:00'), rooms: ['АМФ ФИНКИ Г']));
    examList.add(Exam(id:11, name: 'Вештачка интелигенција', dateTime: DateTime.parse('2026-01-20T09:30:00'), rooms: ['Просторија 13', 'Просторија 12']));
    examList.add(Exam(id:12, name: 'Веб програмирање', dateTime: DateTime.parse('2026-02-20T11:00:00'), rooms: ['АМФ МФ']));
    examList.add(Exam(id:13, name: 'Машинско учење', dateTime: DateTime.parse('2026-03-12T09:30:00'), rooms: ['Просторија 315']));
    examList.add(Exam(id:14, name: 'Веб дизајн', dateTime: DateTime.parse('2026-05-28T13:00:00'), rooms: ['АМФ ФИНКИ М']));
    examList.add(Exam(id:15, name: 'Веб дизајн', dateTime: DateTime.parse('2026-05-28T13:00:00'), rooms: ['АМФ ФИНКИ М']));
    examList.add(Exam(id:16, name: 'Интернет технологии', dateTime: DateTime.parse('2026-02-05T09:00:00'), rooms: ['Просторија 214']));

    examList.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    setState(() {
      _exam = examList;
      _isLoading = false;
    });
  }
}
