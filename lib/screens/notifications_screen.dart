import 'package:flutter/material.dart';
import 'package:medicine_app/theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

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
                'Activity & Notifications',
                style: boldTextStyle.copyWith(fontSize: 30),
              ),
              Center(
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
                      'Oops, there are no activity or notifications',
                      style: boldTextStyle.copyWith(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Your activities or notifications will be shown here',
                      style: regularTextStyle.copyWith(
                          fontSize: 20, color: greyLightColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
