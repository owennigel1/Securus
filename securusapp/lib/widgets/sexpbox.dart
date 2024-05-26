import 'package:flutter/material.dart';

class SExpenditureBox extends StatefulWidget {
  final Color color;
  final Color accent;
  final double amount;
  final String title;
  final IconData icon;

  const SExpenditureBox(
      {super.key,
      required this.color,
      required this.accent,
      required this.amount,
      required this.title,
      required this.icon});

  @override
  State<SExpenditureBox> createState() => _SExpenditureBoxState();
}

class _SExpenditureBoxState extends State<SExpenditureBox> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 140),
      scale: _active ? 1.03 : 1.0,
      child: GestureDetector(
        onTapDown: (_) => setState(() {
          _active = true;
        }),
        onTapUp: (_) => setState(() {
          _active = false;
        }),
        child: Container(
          width: 170.0,
          height: 150.0,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), color: widget.color),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: widget.accent),
                    child: Icon(
                      widget.icon,
                      size: 28.0,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-10, -4),
                    child: Transform.rotate(
                        angle: 3.142, child: const Icon(Icons.arrow_back_ios)),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Text(
                "\$${widget.amount.toStringAsFixed(1)}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 14.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
