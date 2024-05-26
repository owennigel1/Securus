import 'package:flutter/material.dart';

class SContainerButton extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final String description;
  final bool selected;
  const SContainerButton(
      {super.key,
      required this.width,
      required this.height,
      required this.title,
      required this.description,
      this.selected = false});

  @override
  State<SContainerButton> createState() => _SContainerButtonState();
}

class _SContainerButtonState extends State<SContainerButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: widget.selected ? 1.02 : 1.0,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: widget.selected
                ? Border.all(
                    color: const Color.fromARGB(255, 103, 218, 26), width: 2.0)
                : Border.all(color: const Color(0xffA7A7A7), width: 2.0)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Text(
                    widget.description,
                    style: const TextStyle(fontSize: 15.0, height: 1.8),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
