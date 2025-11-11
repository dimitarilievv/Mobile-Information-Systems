import 'package:laboratory_task_1/models/exam_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailData extends StatelessWidget {
  final Exam exam;

  const DetailData({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Детали',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _infoRow('Име на предмет', exam.name),
          _infoRow('Датум', DateFormat('dd.MM.yyyy').format(exam.dateTime)),
          _infoRow('Време', DateFormat('HH:mm').format(exam.dateTime)),
          _infoRow('Простории', exam.rooms.join(', ')),
          _infoRow('Преостанато време', _formatRemaining(exam.dateTime)),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              textAlign: TextAlign.right,
              softWrap: true,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  String _formatRemaining(DateTime examDateTime) {
    final now = DateTime.now();
    Duration diff = examDateTime.difference(now);

    final bool isPast = diff.isNegative;
    diff = diff.abs();

    final int days = diff.inDays;
    final int hours = diff.inHours - days * 24;

    final String formatted = '$days дена, $hours часа';
    return isPast ? 'Поминат: $formatted' : formatted;
  }
}
