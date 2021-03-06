import 'package:flutter/material.dart';

class Doctor with ChangeNotifier {
  final String? id;
  final String? name;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? email;
  final String? location;
  final List<Map<String, String>>? schedules;

  Doctor({
    @required this.id,
    @required this.name,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.email,
    @required this.location,
    @required this.schedules,
  });
}
