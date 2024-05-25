import 'package:flutter/material.dart';

class SInputField extends StatelessWidget {
  final String title;
  final String placeholder;
  final bool secret;
  final TextEditingController controller;
  final Widget? leading;
  final Widget? ending;

  const SInputField(
      {super.key,
      required this.title,
      required this.placeholder,
      required this.controller,
      this.secret = false,
      this.leading,
      this.ending});

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
        SizedBox(
          width: 350.0,
          child: TextField(
            controller: controller,
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                hintText: placeholder,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            style: const TextStyle(height: 1.4),
          ),
        )
      ],
    );
  }
}
