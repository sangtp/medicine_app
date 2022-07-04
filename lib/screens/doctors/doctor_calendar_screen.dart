import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_app/theme.dart';

import '../../widgets/calendar_widget.dart';
import 'event_editing_screen.dart';

class DoctorCalendarScreen extends StatelessWidget {
  const DoctorCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch của tôi'),
      ),
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => EventEditingScreen(),
          ),
        ),
      ),
    );
  }
}
