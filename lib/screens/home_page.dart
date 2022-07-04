import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/screens/admin/manage_doctors_screen.dart';
import 'package:medicine_app/screens/admin/manage_users_screen.dart';
import 'package:medicine_app/screens/admin/mange_articles_screen.dart';
import 'package:medicine_app/screens/admin/statistics_screen.dart';
import 'package:medicine_app/screens/profile_page.dart';

import './product_screen.dart';
import '../theme.dart';
import '../widgets/button_primary.dart';
import '../widgets/newsfeed_slider.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user1 = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: user1.email != 'admin@admin.com'
          ? UserHomePage(user1: user1)
          : AdminHomePage(user1: user1),
    );
  }
}

class UserHomePage extends StatelessWidget {
  const UserHomePage({
    Key? key,
    required this.user1,
  }) : super(key: key);

  final User user1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Xin chào, ${user1.email}!',
                    style: regularTextStyle.copyWith(
                        fontSize: 15, color: greyBoldColor),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProductScreen.routeName);
                },
                icon: const Icon(
                  Icons.newspaper,
                  size: 30,
                ),
                color: greenColor,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffe4faf0)),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xffb1d9b2),
                ),
                hintText: 'Tìm kiếm...',
                hintStyle: regularTextStyle.copyWith(
                  color: const Color(0xffb1d9b2),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Tin tức nổi bật',
            style: regularTextStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const NewsFeedSlider(),
          const SizedBox(
            height: 20,
          ),
          ButtonPrimary(
            onTap: () {
              Navigator.of(context).pushNamed(ProductScreen.routeName);
            },
            text: 'Đến Bản Tin',
          )
        ],
      ),
    );
  }
}

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({
    Key? key,
    required this.user1,
  }) : super(key: key);

  final User user1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Xin chào, ${user1.email}!',
                    style: regularTextStyle.copyWith(
                        fontSize: 15, color: greyBoldColor),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProductScreen.routeName);
                },
                icon: const Icon(
                  Icons.newspaper,
                  size: 30,
                ),
                color: greenColor,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          buildListTile(
            title: 'Quản lý bài viết',
            leadingIcon: const Icon(
              Icons.newspaper,
              size: 40,
              color: Colors.blueGrey,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(ManageArticlesScreen.routeName);
            },
          ),
          buildListTile(
            title: 'Quản lý người dùng',
            leadingIcon: const Icon(
              Icons.person,
              size: 40,
              color: Color.fromARGB(255, 122, 111, 14),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(ManageUsersScreen.routeName);
            },
          ),
          buildListTile(
            title: 'Quản lý bác sĩ',
            leadingIcon: const Icon(
              Icons.medical_information,
              size: 40,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(ManageDoctorsScreen.routeName);
            },
          ),
          buildListTile(
            title: 'Xem thống kê',
            leadingIcon: const Icon(
              Icons.pie_chart,
              size: 40,
              color: Colors.orange,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(StatisticsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
      {String? title, Icon? leadingIcon, VoidCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: ListTile(
        leading: leadingIcon,
        title: Text(title!),
        onTap: onTap,
        trailing: const Icon(
          Icons.arrow_right,
          size: 50,
          color: greenColor,
        ),
      ),
    );
  }
}
