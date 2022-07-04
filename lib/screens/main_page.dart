import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import '../screens/notifications_screen.dart';
import '../screens/doctor_screen.dart';
import '../screens/home_page.dart';
import '../screens/profile_page.dart';
import '../screens/notifications_screen.dart';
import '../screens/edit_profile_screen.dart';

class MainPages extends StatefulWidget {
  const MainPages({Key? key}) : super(key: key);

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int _selectedIndex = 0;
  final user1 = FirebaseAuth.instance.currentUser!;

  final _userPageList = [
    HomePages(),
    DoctorScreen(),
    NotificationsScreen(),
    ProfilePages(),
  ];

  final _adminPageList = [
    HomePages(),
    ProfilePages(),
  ];

  final _doctorPageList = [
    HomePages(),
    NotificationsScreen(),
    ProfilePages(),
  ];

  onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: user1.email == 'admin@admin.com'
          ? _adminPageList.elementAt(_selectedIndex)
          : user1.email == 'doctor1@doctor.com'
              ? _doctorPageList.elementAt(_selectedIndex)
              : _userPageList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          if (user1.email != 'admin@admin.com' &&
              user1.email != 'doctor1@doctor.com')
            const BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              label: "Bác sĩ",
            ),
          if (user1.email != 'admin@admin.com')
            const BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Thông báo",
            ),
          BottomNavigationBarItem(
            icon: user1.email!.contains('@admin.com')
                ? const Icon(Icons.settings)
                : const Icon(Icons.person),
            label: user1.email == 'admin@admin.com' ? "Admin" : "Cá nhân",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onTappedItem,
        unselectedItemColor: grey365Color,
        iconSize: 25,
        selectedItemColor: greenColor,
      ),
    );
  }
}
