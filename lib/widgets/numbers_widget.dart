import 'package:flutter/material.dart';
import 'package:medicine_app/theme.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(context, '4.8', 'Ranking'),
            buildDivider(),
            buildButton(context, '35', 'Following'),
            buildDivider(),
            buildButton(context, '50', 'Followers'),
          ],
        ),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(value, style: boldTextStyle.copyWith(fontSize: 16)),
            const SizedBox(
              height: 2,
            ),
            Text(text, style: regularTextStyle.copyWith(color: greyLightColor)),
          ],
        ),
      );

  Widget buildDivider() => Container(height: 24, child: VerticalDivider());
}
