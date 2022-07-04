import 'package:flutter/material.dart';
import 'package:medicine_app/theme.dart';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;

  const Event({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    this.backgroundColor = lightGreenColor,
    this.isAllDay = false,
  });
}
