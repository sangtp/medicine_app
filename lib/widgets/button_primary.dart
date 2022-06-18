import 'package:flutter/material.dart';

import '../theme.dart';

class ButtonPrimary extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;

  const ButtonPrimary({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onTap,
        child: Text(text!),
      ),
    );
  }
}
