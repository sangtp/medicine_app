import 'package:flutter/material.dart';
import 'package:medicine_app/theme.dart';

class SettingCard extends StatelessWidget {
  final String _name;
  const SettingCard(this._name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color(0xffb1d9b2),
      ),
      child: Center(
        child: Text(
          _name,
          style: boldTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
