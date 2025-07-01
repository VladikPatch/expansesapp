import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  void _showDatePicker(BuildContext context) async {
    final DateTime initialDate = DateTime.now();
    final DateTime firstDate = DateTime(initialDate.year - 1);
    final DateTime lastDate = DateTime(initialDate.year + 1);

    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (date != null) {
      onDateChanged(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(formatter.format(selectedDate)),
        SizedBox(width: 5),
        IconButton(
          onPressed: () => _showDatePicker(context),
          icon: Icon(Icons.calendar_month),
        ),
      ],
    );
  }
}
