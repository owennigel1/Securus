import 'package:flutter/material.dart';

class SDropdownButton extends StatelessWidget {
  const SDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (_) => {},
      items: [DropdownMenuItem(child: Text("Hello"))],
    );
  }
}
