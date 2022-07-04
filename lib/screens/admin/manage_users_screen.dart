import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/theme.dart';

class ManageUsersScreen extends StatelessWidget {
  static const routeName = '/admin-manage-users';
  const ManageUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quản lý người dùng',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: lightGreenColor,
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(user!.email!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.date_range,
                        color: Colors.purpleAccent,
                      ),
                      Text('24-06-2022'),
                    ],
                  ),
                ],
              ),
              trailing: PopupMenuButton(
                itemBuilder: (_) => [
                  const PopupMenuItem(
                    child: Text('Chỉnh sửa'),
                  ),
                  const PopupMenuItem(
                    child: Text('Xóa'),
                  ),
                ],
              ),
              title: Text(
                user.uid,
                style: boldTextStyle.copyWith(fontSize: 20),
                maxLines: 1,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(
          color: lightGreenColor,
        ),
        itemCount: 10,
      ),
    );
  }
}
