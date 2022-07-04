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
        title: Text('Chọn Thời Gian'),
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
              'Chọn ngày',
              style: boldTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PickupDateWidget('Thứ Tư', '22-06-22'),
                  PickupDateWidget('Thứ Năm', '23-06-22'),
                  PickupDateWidget('Thứ Sáu', '24-06-22'),
                  PickupDateWidget('Thứ Bảy', '25-06-22'),
                  PickupDateWidget('Chủ nhật', '26-06-22'),
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
              'Chọn giờ',
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
              'Dịch vụ',
              style: boldTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    chooseWidget('Khám tổng quát'),
                    const SizedBox(
                      height: 5,
                    ),
                    chooseWidget('Khám răng'),
                    const SizedBox(
                      height: 5,
                    ),
                    chooseWidget('Khám mắt'),
                    const SizedBox(
                      height: 5,
                    ),
                    chooseWidget('Tái khám'),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonPrimary(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppointmentConfirmScreen.routeName);
                      },
                      text: 'Xác Nhận',
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

  Container chooseWidget(String serviceName) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightGreenColor,
      ),
      child: serviceWidget(serviceName),
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
