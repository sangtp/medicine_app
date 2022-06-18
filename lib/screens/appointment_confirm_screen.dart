import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_app/screens/track_appointment_screen.dart';
import 'package:medicine_app/theme.dart';

import '../widgets/button_primary.dart';

class AppointmentConfirmScreen extends StatelessWidget {
  static const routeName = '/appointment-confirm';
  const AppointmentConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/order_success_illustration.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Thank you for choosing us!',
              style: boldTextStyle,
            ),
            Text(
              'Your order has been placed and we will pick up your clothes on time!',
              style: regularTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order ID',
                  style: boldTextStyle.copyWith(fontSize: 16),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: lightGreenColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    '1001',
                    style: boldTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Clothes Count',
                  style: boldTextStyle.copyWith(fontSize: 16),
                ),
                Text(
                  '10',
                  style: boldTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pick up Date & Time',
                  style: boldTextStyle.copyWith(fontSize: 16),
                ),
                Text(
                  'Wednesday, 07 Aug. 2022. Between 10:00 AM & 12:00 AM',
                  style: regularTextStyle.copyWith(
                      fontSize: 16, color: Colors.grey),
                )
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: boldTextStyle,
                ),
                Text(
                  'Cash',
                  style: boldTextStyle.copyWith(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonPrimary(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text('Are you sure?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TrackAppointmentScreen(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Book Successful'),
                            ),
                          );
                        },
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'),
                      ),
                    ],
                  ),
                );
              },
              text: 'Confirm',
            ),
          ],
        ),
      ),
    );
  }

  Container divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 1,
      color: greenColor,
    );
  }
}
