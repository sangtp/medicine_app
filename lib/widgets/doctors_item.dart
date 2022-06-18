import 'dart:math';

import 'package:flutter/material.dart';

import 'package:medicine_app/theme.dart';
import 'package:provider/provider.dart';

import '../providers/doctor.dart';
import '../screens/doctor_detail_screen.dart';

class DoctorItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(DoctorDetailScreen.routeName,
                  arguments: doctor.id);
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.asset(doctor.imageUrl!),
                  title: Text(
                    doctor.name!,
                    style: boldTextStyle,
                  ),
                  subtitle: Text(doctor.title!),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
