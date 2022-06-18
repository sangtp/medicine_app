import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_app/theme.dart';

class PickupDateWidget extends StatefulWidget {
  final String day;
  final String date;
  bool isActive;
  PickupDateWidget(this.day, this.date, {Key? key, this.isActive = false})
      : super(key: key);

  @override
  State<PickupDateWidget> createState() => _PickupDateWidgetState();
}

class _PickupDateWidgetState extends State<PickupDateWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isActive = !widget.isActive;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: widget.isActive ? greenColor : Colors.grey.withOpacity(0.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.day,
              style: regularTextStyle.copyWith(
                color: widget.isActive ? Colors.white : blackColor,
                fontSize: 20,
              ),
            ),
            Text(
              widget.date,
              style: regularTextStyle.copyWith(
                color: widget.isActive ? Colors.white : blackColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
