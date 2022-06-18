import 'package:flutter/material.dart';
import 'package:medicine_app/providers/doctors.dart';
import 'package:medicine_app/providers/products.dart';
import 'package:medicine_app/widgets/doctors_item.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/doctors.dart';

class DoctorsList extends StatefulWidget {
  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  Widget build(BuildContext context) {
    final doctorsData = Provider.of<Doctors>(context);
    final doctors = doctorsData.items;
    return Container(
      height: 500,
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: doctors.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: doctors[i],
          child: DoctorItem(),
        ),
      ),
    );
  }
}
