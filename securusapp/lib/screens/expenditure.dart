import 'package:securusapp/widgets/sarchart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:securusapp/widgets/sexpbox.dart';
import 'package:securusapp/widgets/stag.dart';

class ExpenditureScreen extends StatefulWidget {
  const ExpenditureScreen({super.key});

  @override
  State<ExpenditureScreen> createState() => _ExpenditureScreenState();
}

class _ExpenditureScreenState extends State<ExpenditureScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 80.0),
        const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text("Expenditure",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        ),
        const SizedBox(height: 50.0),
        const Align(
          alignment: Alignment.center,
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
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                child: Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 1.0),
                  const SExpenditureBox(
                      color: Color.fromARGB(255, 156, 203, 253),
                      accent: Color.fromARGB(255, 105, 159, 218),
                      amount: 1200.0,
                      title: "Needs"),
                  Container(
                    width: 170.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromARGB(255, 147, 255, 190)),
                  ),
                  const SizedBox(width: 1.0),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
