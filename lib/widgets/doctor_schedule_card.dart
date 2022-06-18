import 'package:flutter/material.dart';
import 'package:medicine_app/screens/appointment_screen.dart';
import 'package:medicine_app/theme.dart';
import 'package:provider/provider.dart';

import '../providers/doctors.dart';

class DoctorScheduleCard extends StatelessWidget {
  final Color? color;

  DoctorScheduleCard(this.color);
  @override
  Widget build(BuildContext context) {
    final String doctorId =
        ModalRoute.of(context)!.settings.arguments as String;
    final loadedDoctor = Provider.of<Doctors>(
      context,
      listen: false,
    ).findById(doctorId);
    return Container(
      // height: 300,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color!.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: color!.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '12',
                    style:
                        boldTextStyle.copyWith(fontSize: 20, color: greenColor),
                  ),
                  Text(
                    'Jun',
                    style:
                        boldTextStyle.copyWith(fontSize: 16, color: greenColor),
                  ),
                ],
              ),
            ),
            title: Text(
              'Consultation',
              style: boldTextStyle.copyWith(color: Colors.yellowAccent),
            ),
            subtitle: Text(
              'Sunday 9am-12am',
              style: regularTextStyle,
            ),
            trailing: const Icon(
              Icons.keyboard_double_arrow_right,
              color: greenColor,
              size: 30,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AppointmentScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
