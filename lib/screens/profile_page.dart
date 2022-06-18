import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';
import '../user_references.dart';
import '../models/user.dart' as User;
import '../widgets/numbers_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/button_primary.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/setting_screen.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserReferences.myUser;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            ProfileWidget(
              imageUrl: user.imageUrl,
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
            buildName(user),
            const SizedBox(
              height: 24,
            ),
            Center(child: buildModifyButton()),
            const SizedBox(
              height: 24,
            ),
            const NumbersWidget(),
            const SizedBox(
              height: 48,
            ),
            buildAbout(user),
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
            label: 'Mail',
            onTap: () {},
          ),
          SpeedDialChild(
              child: Icon(Icons.settings),
              label: 'Settings',
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

  Widget buildModifyButton() => ButtonPrimary(
        text: 'Edit ProFile',
        onTap: () {},
      );

  Widget buildAbout(User.User myUser) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: boldTextStyle.copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              myUser.about!,
              style: regularTextStyle.copyWith(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
