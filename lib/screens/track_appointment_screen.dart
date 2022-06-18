import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_app/screens/appointment_confirm_screen.dart';
import 'package:medicine_app/theme.dart';

class TrackAppointmentScreen extends StatefulWidget {
  const TrackAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<TrackAppointmentScreen> createState() => _TrackAppointmentScreenState();
}

class _TrackAppointmentScreenState extends State<TrackAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Track Appointment'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Oder Number 1001',
              style: boldTextStyle.copyWith(fontSize: 20),
            ),
            Text(
              'Order Number Confirmed. Ready to Pick',
              style:
                  regularTextStyle.copyWith(fontSize: 15, color: Colors.grey),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 1,
              color: greenColor,
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 13, top: 40),
                  width: 4,
                  height: 400,
                  color: lightGreenColor,
                ),
                Column(
                  children: [
                    statusWidget('confirm', 'Confirmed', true),
                    statusWidget('contact_doctor', 'Contacted', false),
                    statusWidget('in_progress', 'In Process', false),
                    statusWidget('meeting_online', 'Meeting', false),
                    statusWidget('delivered', 'Success', false),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 1,
              color: greenColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(color: greenColor),
                    ),
                    child: Text(
                      'Cancel',
                      style: regularTextStyle.copyWith(color: greenColor),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: greenColor,
                  ),
                  child: Text(
                    'My Order',
                    style: regularTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container statusWidget(String img, String status, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? greenColor : Colors.white,
              border: Border.all(
                color: isActive ? Colors.transparent : greenColor,
                width: 3,
              ),
            ),
          ),
          const SizedBox(width: 50),
          Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/$img.png'),
                      fit: BoxFit.contain),
                ),
              ),
              Text(
                status,
                style: regularTextStyle.copyWith(
                    color: isActive ? greenColor : blackColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
