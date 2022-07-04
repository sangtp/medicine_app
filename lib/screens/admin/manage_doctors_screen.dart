import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/doctors.dart';
import '../../theme.dart';

class ManageDoctorsScreen extends StatelessWidget {
  static const routeName = '/admin-manage-doctors';
  const ManageDoctorsScreen({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final doctorsData = Provider.of<Doctors>(context);
    final doctors = doctorsData.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quản lý bác sĩ',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: doctors[index],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: lightGreenColor,
              ),
              child: ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  backgroundImage: AssetImage(doctors[index].imageUrl!),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      doctors[index].email!,
                      style: regularTextStyle.copyWith(fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                        ),
                        Text(
                          doctors[index].location!,
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: PopupMenuButton(
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('Chỉnh sửa'),
                    ),
                    PopupMenuItem(
                      child: const Text('Xóa'),
                      onTap: () {
                        doctorsData.deleteDoctor(doctors[index].id!);
                      },
                    ),
                  ],
                ),
                title: Text(
                  doctors[index].name!,
                  style: boldTextStyle.copyWith(fontSize: 20),
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(
          color: lightGreenColor,
        ),
        itemCount: doctors.length,
      ),
    );
  }
}
