import 'package:flutter/material.dart';
import 'package:laboratory_task_1/models/exam_model.dart';

import '../widgets/detail_data.dart';
import '../widgets/detail_title.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: Text(exam.name.toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.teal.shade300,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            DetailTitle(id: exam.id, name: exam.name),
            const SizedBox(height: 30),
            DetailData(exam: exam),
          ],
        ),
      ),
    );
  }
}
