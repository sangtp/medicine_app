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
        title: Text('Xác Nhận Lịch Hẹn'),
        backgroundColor: greenColor,
        elevation: 0,
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
              'Cảm ơn bạn đã chọn chúng tôi!',
              style: boldTextStyle,
            ),
            Text(
              'Lịch hẹn của bạn đã được đặt thành công, vui lòng xác nhận và đến đúng giờ!',
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
                  'Mã lịch hẹn',
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
                  'Số dịch vụ',
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Thời gian',
                  style: boldTextStyle.copyWith(fontSize: 16),
                ),
                Text(
                  'Thứ Tư, 22-06-2022. Từ 10:00 đến 12:00',
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
                  'Phương thức thanh toán',
                  style: boldTextStyle,
                ),
                Text(
                  'Tiền mặt',
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
                    content: const Text('Xác nhận đặt lịch?'),
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
                              content: Text('Đặt lịch thành công!'),
                            ),
                          );
                        },
                        child: const Text('Có'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Không'),
                      ),
                    ],
                  ),
                );
              },
              text: 'Xác Nhận',
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
