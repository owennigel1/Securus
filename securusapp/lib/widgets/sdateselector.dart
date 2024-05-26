import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SDateSelector extends StatelessWidget {
  final String title;
  final DateTime? date;
  final void Function()? onTap;

  const SDateSelector({super.key, required this.title, this.onTap, this.date});

  final List<String> months = const [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              title,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
            )),
        const SizedBox(height: 10.0),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 350.0,
            height: 55.0,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(date != null ? date!.day.toString() : "Day")),
                Container(width: 1.0, height: 40.0, color: Colors.grey),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child:
                        Text(date != null ? months[date!.month - 1] : "Month")),
                Container(width: 1.0, height: 40.0, color: Colors.grey),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(date != null ? date!.year.toString() : "Year")),
              ],
            ),
          ),
        )
      ],
    );
  }
}
