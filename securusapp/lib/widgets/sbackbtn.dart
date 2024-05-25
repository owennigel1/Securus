import 'package:flutter/material.dart';

class SBackButton extends StatelessWidget {
  final void Function()? onTap;
  const SBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 55.0,
        height: 55.0,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xffEBEBEB)),
        child: Transform.translate(
          offset: const Offset(-1, 0),
          child: const Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
