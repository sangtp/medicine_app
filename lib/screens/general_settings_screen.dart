import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:medicine_app/theme.dart';

class GeneralSettingsScreen extends StatelessWidget {
  const GeneralSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài Đặt Chung'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildListTile(
                title: 'Đổi mật khẩu',
                icon: const Icon(
                  Icons.lock_person,
                  color: Colors.purple,
                ),
                onTap: () {},
              ),
              buildListTile(
                title: 'Ngôn ngữ',
                icon: const Icon(
                  Icons.language,
                  color: Colors.purple,
                ),
                onTap: () {},
              ),
              buildListTile(
                title: 'Chế độ tối',
                icon: const Icon(
                  Icons.dark_mode,
                  color: Colors.purple,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile({String? title, Icon? icon, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightGreenColor,
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title!,
          textAlign: TextAlign.start,
          style: boldTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
        leading: icon,
      ),
    );
  }
}
