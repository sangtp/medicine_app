import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_app/screens/auth_page.dart';
import 'package:medicine_app/screens/general_settings_screen.dart';
import 'package:medicine_app/theme.dart';
import 'package:medicine_app/widgets/setting_card.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final user1 = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      //backgroundColor: Color(0xffb1d9b2),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: greenColor,
                        ),
                      ),
                      Text(
                        'Cài Đặt',
                        style: boldTextStyle.copyWith(fontSize: 30),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacementNamed(
                              context, RegisterPages.routeName);
                        },
                        icon: const Icon(
                          Icons.logout,
                          size: 30,
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 16,
              ),
              children: [
                SettingCard(
                  'Cài đặt chung',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => GeneralSettingsScreen(),
                      ),
                    );
                  },
                ),
                SettingCard('Cập nhật ứng dụng'),
                SettingCard('Chính sách bảo mật'),
                SettingCard('Điều khoản dịch vụ'),
                SettingCard('Liên hệ'),
                SettingCard('Giúp đỡ'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'UID : ',
                style: boldTextStyle.copyWith(fontSize: 20),
              ),
              Text(
                user1.uid,
                style:
                    boldTextStyle.copyWith(fontSize: 15, color: greyLightColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
