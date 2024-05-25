import 'package:flutter/material.dart';

class SButton extends StatefulWidget {
  final String title;
  final bool disabled;
  final void Function()? onTap;
  const SButton(
      {super.key, required this.title, this.disabled = false, this.onTap});

  @override
  State<SButton> createState() => _SButtonState();
}

class _SButtonState extends State<SButton> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapUp: (_) => setState(() => active = false),
      onTapCancel: () => setState(() => active = false),
      onTapDown: (_) => setState(() => active = true),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 80),
        scale: active ? 1.02 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 80),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 55.0,
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          decoration: BoxDecoration(
              color: !active
                  ? const Color(0xffAEE67F)
                  : const Color.fromARGB(255, 212, 235, 193),
              borderRadius: BorderRadius.circular(30.0)),
          child: Transform.translate(
              offset: const Offset(-2, 0),
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0),
              )),
        ),
      ),
    );
  }
}
