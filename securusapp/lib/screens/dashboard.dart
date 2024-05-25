import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80.0),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text("Dashboard",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        ),
      ],
    );
  }
}
