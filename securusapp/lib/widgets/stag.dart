import 'package:flutter/material.dart';

class STag extends StatelessWidget {
  final String title;
  final double percent;
  final Color color;
  final Color textColor;

  const STag(
      {super.key,
      required this.title,
      required this.color,
      required this.textColor,
      required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.normal, color: textColor),
            ),
          ),
          Text(
            "${percent.round().toString()}%",
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
        ],
      ),
    );
  }
}
