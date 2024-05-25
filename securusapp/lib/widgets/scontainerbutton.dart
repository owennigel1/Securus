import 'package:flutter/material.dart';

class SContainerButton extends StatefulWidget {
  final double width;
  final double height;
  const SContainerButton(
      {super.key, required this.width, required this.height});

  @override
  State<SContainerButton> createState() => _SContainerButtonState();
}

class _SContainerButtonState extends State<SContainerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: const Color(0xffA7A7A7), width: 2.0)),
    );
  }
}
