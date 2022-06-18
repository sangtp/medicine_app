import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../theme.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: const BackButton(
      color: greenColor,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(icon),
        color: greenColor,
      ),
    ],
  );
}
