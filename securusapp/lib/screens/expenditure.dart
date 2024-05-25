import 'package:flutter/cupertino.dart';
import 'package:securusapp/widgets/sarchart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:securusapp/widgets/sexpbox.dart';

class ExpenditureScreen extends StatefulWidget {
  const ExpenditureScreen({super.key});

  @override
  State<ExpenditureScreen> createState() => _ExpenditureScreenState();
}

class _ExpenditureScreenState extends State<ExpenditureScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80.0),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text("Expenditure",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        ),
        SizedBox(height: 40.0),
        Expanded(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: PieChart(
                  data: [
                    PieChartData(Color(0xff336699), 1200 / 6830 * 100),
                    PieChartData(Color(0xff86BBD8), 500 / 6830 * 100),
                    PieChartData(Color(0xff2F4858), 1000 / 6830 * 100),
                    PieChartData(Color(0xff9EE493), 900 / 6830 * 100),
                    PieChartData(Color(0xffDAF7DC), 180 / 6830 * 100), // 60
                    PieChartData(Color(0xffD7FFF1), 300 / 6830 * 100),
                    PieChartData(Color(0xffAAFCB8), 520 / 6830 * 100), // 120
                    PieChartData(Color(0xff8CD790), 1250 / 6830 * 100),
                    PieChartData(Color(0xff77AF9C), 800 / 6830 * 100), // 300
                    PieChartData(Color(0xff285943), 1200 / 6830 * 100),
                  ],
                  radius: 140,
                  strokeWidth: 18.0,
                  child: Column(
                    children: [
                      Text(
                        'Total Expenditure',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 103, 103, 103)),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        '\$2438.0',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 180.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 16.0),
                        SExpenditureBox(
                            color: Color.fromARGB(255, 156, 203, 253),
                            accent: Color.fromARGB(255, 105, 159, 218),
                            amount: 1200.0,
                            icon: Icons.house_outlined,
                            title: "Needs"),
                        SizedBox(width: 20.0),
                        SExpenditureBox(
                            color: Color.fromARGB(255, 133, 236, 143),
                            accent: Color.fromARGB(255, 52, 197, 86),
                            amount: 1200.0,
                            icon: CupertinoIcons.heart,
                            title: "Wants"),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 16.0),
                        SExpenditureBox(
                            color: Color.fromARGB(255, 166, 190, 215),
                            accent: Color.fromARGB(255, 120, 151, 186),
                            amount: 1200.0,
                            icon: Icons.money_rounded,
                            title: "Savings"),
                        SizedBox(width: 20.0),
                        SExpenditureBox(
                            color: Color.fromARGB(255, 181, 224, 125),
                            accent: Color.fromARGB(255, 129, 180, 120),
                            amount: 1200.0,
                            icon: Icons.balance,
                            title: "Investments"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
