import 'package:flutter/material.dart';
import 'package:medicine_app/screens/appointment_confirm_screen.dart';

import '../theme.dart';
import '../widgets/button_primary.dart';
import '../widgets/checkbox_widget.dart';
import '../widgets/pickup_date_widget.dart';
import '../widgets/pickup_time_widget.dart';

class AppointmentScreen extends StatefulWidget {
  static const routeName = '/appointment';
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date & Time'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick Up Date',
              style: boldTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PickupDateWidget('Web', '07 Aug'),
                  PickupDateWidget('Thu', '08 Aug'),
                  PickupDateWidget('Fri', '09 Aug'),
                  PickupDateWidget('Sat', '10 Aug'),
                  PickupDateWidget('Sun', '11 Aug'),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              color: greyLightColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Pick Up Time',
              style: boldTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PickupTimeWidget("10:00 AM - 12:00 PM"),
                  PickupTimeWidget("12:00 PM - 02:00 PM"),
                  PickupTimeWidget("02:00 PM - 04:00 PM"),
                  PickupTimeWidget("04:00 PM - 06:00 PM"),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Pick Up Service',
              style: boldTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    chooseWidget(),
                    const SizedBox(
                      height: 5,
                    ),
                    chooseWidget(),
                    const SizedBox(
                      height: 5,
                    ),
                    chooseWidget(),
                    const SizedBox(
                      height: 5,
                    ),
                    chooseWidget(),
                    const SizedBox(
                      height: 5,
                    ),
                    chooseWidget(),
                    const SizedBox(
                      height: 5,
                    ),
                    chooseWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonPrimary(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppointmentConfirmScreen.routeName);
                        // showDialog(
                        //   context: context,
                        //   builder: (context) => AlertDialog(
                        //     content: const Text('Are you sure?'),
                        //     actions: [
                        //       TextButton(
                        //         onPressed: () {
                        //           Navigator.of(context).pop();
                        //           ScaffoldMessenger.of(context).showSnackBar(
                        //             const SnackBar(
                        //               content: Text('Book Successful'),
                        //             ),
                        //           );
                        //         },
                        //         child: const Text('Yes'),
                        //       ),
                        //       TextButton(
                        //         onPressed: () {
                        //           Navigator.of(context).pop();
                        //         },
                        //         child: const Text('No'),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      },
                      text: 'BOOK',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container chooseWidget() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightGreenColor,
      ),
      child: serviceWidget('Visit'),
    );
  }

  ListTile serviceWidget(
    String serviceTitle,
  ) {
    return ListTile(
      title: Text(
        serviceTitle,
        style: boldTextStyle.copyWith(color: Colors.yellowAccent),
      ),
      trailing: const CheckBoxWidget(),
      onTap: () {},
    );
  }
}
