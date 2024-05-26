import 'package:flutter/cupertino.dart';

class InvestmentsScreen extends StatefulWidget {
  const InvestmentsScreen({super.key});

  State<InvestmentsScreen> createState() => _InvestmentsScreenState();
}

class _InvestmentsScreenState extends State<InvestmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80.0),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text("Investments",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        ),
      ],
    );
  }
}
