import 'package:flutter/material.dart';
import 'package:medicine_app/theme.dart';
import 'package:medicine_app/widgets/notification_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  var _haveNotification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoạt động & Thông báo',
                style: boldTextStyle.copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              !_haveNotification
                  ? Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/no_history_illustration.png',
                            width: double.infinity,
                            height: 400,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Oops, bạn chưa có thông báo nào!',
                            style: boldTextStyle.copyWith(fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Thông báo và hoạt động của bạn sẽ hiển thị ở đây',
                            style: regularTextStyle.copyWith(
                                fontSize: 20, color: greyLightColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : Container(height: 610, child: NotificationWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
