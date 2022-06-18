import 'package:flutter/material.dart';

import './doctor.dart';

class Doctors with ChangeNotifier {
  final List<Doctor> _items = [
    Doctor(
      id: 'd1',
      name: 'Dr. Stella Kane',
      title: 'Heart Surgeon - Flower Hospitals',
      imageUrl: 'assets/images/doctor1.png',
      description:
          'Dr. Stella is the top most heart surgeon in Flower\nHospital. She has done over 100 successful surgeries\nwithin past 3 years. She has achieved several\nawards for her wonderful contribution is her own\nfield. She\'s available for private consultation for\ngive schedules.',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
    Doctor(
      id: 'd2',
      name: 'Dr. Joseph Cart',
      title: 'Dental Surgeon - Flower Hospitals',
      imageUrl: 'assets/images/doctor2.png',
      description: 'About Dr. Joseph.',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
    Doctor(
      id: 'd3',
      name: 'Dr. Stephen Strange',
      title: 'Eye Specialist - Flower Hospitals',
      imageUrl: 'assets/images/doctor3.png',
      description: 'About Dr.Stephen Strange',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
    Doctor(
      id: 'd3',
      name: 'Dr. Stephen Strange',
      title: 'Eye Specialist - Flower Hospitals',
      imageUrl: 'assets/images/doctor3.png',
      description: 'About Dr.Stephen Strange',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
    Doctor(
      id: 'd3',
      name: 'Dr. Stephen Strange',
      title: 'Eye Specialist - Flower Hospitals',
      imageUrl: 'assets/images/doctor3.png',
      description: 'About Dr.Stephen Strange',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
    Doctor(
      id: 'd3',
      name: 'Dr. Stephen Strange',
      title: 'Eye Specialist - Flower Hospitals',
      imageUrl: 'assets/images/doctor3.png',
      description: 'About Dr.Stephen Strange',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
    Doctor(
      id: 'd3',
      name: 'Dr. Stephen Strange',
      title: 'Eye Specialist - Flower Hospitals',
      imageUrl: 'assets/images/doctor3.png',
      description: 'About Dr.Stephen Strange',
      schedules: [
        {
          'month': 'Jun',
          'date': '12',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '13',
          'time': '9am-12am',
          'type': 'Consultation',
        },
        {
          'month': 'Jun',
          'date': '14',
          'time': '9am-12am',
          'type': 'Consultation',
        },
      ],
    ),
  ];

  List<Doctor> get items {
    return [..._items];
  }

  Doctor findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    //_items.add(value)
    notifyListeners();
  }
}
