import 'package:flutter/material.dart';

import '../models/exam_model.dart';
import 'package:intl/intl.dart';


class ExamCard extends StatelessWidget{
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final bool isPast = exam.dateTime.isBefore(now);
    final Color borderColor = isPast ? Colors.grey.shade400 : Colors.green.shade900;
    final Color backgroundColor = isPast ? Colors.grey.shade300 : Colors.green.shade100;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: exam);
      },
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(exam.name, style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
              Divider(color: borderColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Tooltip(message: 'Датум', child: Icon(Icons.calendar_today, size: 18, color: borderColor)),
                      const SizedBox(width: 6),
                      Text(DateFormat('dd.MM.yyyy').format(exam.dateTime), style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                  Row(
                    children: [
                      Tooltip(message: 'Време', child: Icon(Icons.access_time, size: 18, color: borderColor)),
                      const SizedBox(width: 6),
                      Text(DateFormat('HH:mm').format(exam.dateTime), style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
              Divider(color: borderColor),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Tooltip(message: 'Простории', child: Icon(Icons.meeting_room, size: 18, color: borderColor)),
                  Flexible(
                    child: Text(
                      exam.rooms.join(', '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black87,fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}