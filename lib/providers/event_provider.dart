import 'package:flutter/cupertino.dart';
import 'package:medicine_app/providers/event.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventOfSelectedDate => events;

  void addEven(Event event) {
    _events.add(event);
    notifyListeners();
  }
}
