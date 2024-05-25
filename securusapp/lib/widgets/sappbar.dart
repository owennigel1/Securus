import 'package:flutter/material.dart';
import 'package:securusapp/widgets/sbackbtn.dart';

class SAppBar extends StatelessWidget {
  final String title;
  final double titleSize;
  final void Function()? onTapBack;

  const SAppBar(
      {super.key,
      required this.title,
      required this.titleSize,
      required this.onTapBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25.0),
      padding: const EdgeInsets.only(
        top: 60.0,
        right: 20.0,
        left: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SBackButton(onTap: onTapBack),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
          )
        ],
      ),
    );
  }
}
