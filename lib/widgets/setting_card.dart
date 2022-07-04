import 'package:flutter/material.dart';
import 'package:medicine_app/screens/general_settings_screen.dart';
import 'package:medicine_app/theme.dart';

class SettingCard extends StatelessWidget {
  final String _name;
  final VoidCallback? onTap;
  const SettingCard(this._name, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color(0xffb1d9b2),
        ),
        child: Center(
          child: Text(
            _name,
            style: boldTextStyle.copyWith(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
