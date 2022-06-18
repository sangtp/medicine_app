import 'package:flutter/material.dart';
import 'package:medicine_app/theme.dart';

class PickupTimeWidget extends StatefulWidget {
  final String? time;
  bool isActive;
  PickupTimeWidget(this.time, {Key? key, this.isActive = false})
      : super(key: key);

  @override
  State<PickupTimeWidget> createState() => _PickupTimeWidgetState();
}

class _PickupTimeWidgetState extends State<PickupTimeWidget> {
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
              widget.time!,
              style: regularTextStyle.copyWith(
                color: widget.isActive ? Colors.white : blackColor,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
