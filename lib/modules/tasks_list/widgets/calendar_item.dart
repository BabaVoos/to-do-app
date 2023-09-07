import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class CalendarItem extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateSelected;

  const CalendarItem({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(
      context,
    );
    return CalendarTimeline(
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(
        const Duration(
          days: 30,
        ),
      ),
      lastDate: DateTime.now().add(
        const Duration(
          days: 365,
        ),
      ),
      onDateSelected: onDateSelected,
      leftMargin: 20,
      monthColor: theme.cardColor,
      dayColor: theme.cardColor,
      dayNameColor: theme.primaryColor,
      activeDayColor: theme.primaryColor,
      activeBackgroundDayColor: theme.canvasColor,
      selectableDayPredicate: (
        date,
      ) =>
          date.day != 32,
      locale: 'en',
    );
  }
}
