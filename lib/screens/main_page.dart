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

  final _pageList = [
    HomePages(),
    DoctorScreen(),
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
      body: _pageList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: "Doctor",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
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
