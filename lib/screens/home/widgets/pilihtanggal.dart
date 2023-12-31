import 'package:date_format/date_format.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class PilihTanggal extends StatelessWidget {
  final Function(DateTime) onDateSelected;

  const PilihTanggal({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime sevenDaysFromNow = DateTime.now().add(Duration(days: 7));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.black,
        selectedTextColor: Colors.white,

        dateTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        daysCount: 7, // Menampilkan tanggal hanya 20 hari ke depan

        onDateChange: (date) {
          if (date.weekday >= DateTime.monday &&
              date.weekday <= DateTime.friday) {
            final formattedDate = formatDate(date, [yyyy, '-', mm, '-', dd]);
            print(formattedDate);
            onDateSelected(date);
          } else {}
        },
      ),
    );
  }
}
