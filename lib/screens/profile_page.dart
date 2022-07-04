import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../theme.dart';
import '../user_references.dart';
import '../models/user.dart' as User;
import '../widgets/numbers_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/button_primary.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/setting_screen.dart';
import 'doctors/doctor_calendar_screen.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserReferences.myUser;
    final user1 = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            if (user1.email!.contains('@admin.com'))
              ProfileWidget(
                imageUrl: 'assets/images/admin_avatar.png',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  );
                },
              ),
            if (!user1.email!.contains('@admin.com'))
              ProfileWidget(
                imageUrl: user1.email!.contains('@doctor.com')
                    ? 'assets/images/doctor4.png'
                    : 'assets/images/avatar.png',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  );
                },
              ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                Text(
                  user1.email == 'admin@admin.com'
                      ? 'Administrator'
                      : user1.uid,
                  style: boldTextStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  user1.email!,
                  style: regularTextStyle.copyWith(color: greyLightColor),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const SizedBox(
              height: 24,
            ),
            if (!user1.email!.contains('@admin.com') &&
                !user1.email!.contains('@doctor.com'))
              const NumbersWidget(),
            const SizedBox(
              height: 48,
            ),
            if (!user1.email!.contains('@doctor.com')) buildAbout(user),
            if (user1.email!.contains('@doctor.com'))
              buildDoctorItem(
                'Xem lịch của tôi',
                const Icon(Icons.calendar_month),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const DoctorCalendarScreen(),
                  ),
                ),
              ),
            if (user1.email!.contains('@doctor.com'))
              const SizedBox(
                height: 24,
              ),
            if (user1.email!.contains('@doctor.com'))
              buildDoctorItem(
                'Xem thông tin hợp đồng',
                const Icon(Icons.help),
              ),
            if (user1.email!.contains('@doctor.com'))
              const SizedBox(
                height: 24,
              ),
            if (user1.email!.contains('@doctor.com'))
              buildDoctorItem(
                'Liên hệ khẩn cấp',
                const Icon(Icons.phone),
              ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        //icon: Icons.settings,
        animatedIcon: AnimatedIcons.menu_close,
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            child: Icon(Icons.mail),
            label: 'E-Mail Góp Ý',
            onTap: () {},
          ),
          SpeedDialChild(
              child: Icon(Icons.settings),
              label: 'Cài Đặt',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => SettingScreen())));
              }),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.linkedin),
          ),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.facebook),
          ),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.youtube),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildName(User.User myUser) => Column(
        children: [
          Text(
            myUser.name!,
            style: boldTextStyle.copyWith(fontSize: 24),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            myUser.email!,
            style: regularTextStyle.copyWith(color: greyLightColor),
          ),
        ],
      );

  Widget buildAbout(User.User myUser) {
    final user1 = FirebaseAuth.instance.currentUser!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Giới thiệu',
            style: boldTextStyle.copyWith(fontSize: 24),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user1.email == 'admin@admin.com' ? 'Administrator' : myUser.about!,
            style: regularTextStyle.copyWith(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget buildDoctorItem(
    String text,
    Icon icon, {
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: greenColor),
      ),
      child: ListTile(
        onTap: onTap,
        leading: icon,
        title: Text(
          text,
          style: boldTextStyle.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
