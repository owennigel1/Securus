import 'package:flutter/material.dart';
import 'package:securusapp/widgets/sample_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 80.0),
        const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text("Dashboard",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        ),
        Stack(
          children: [
            Column(
              children: [
                Transform.translate(
                  offset: const Offset(-60, 0),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Projected Wealth",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 128, 128, 128)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("-\$5,310,816.24",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40.0)),
                ),
                Transform.translate(
                  offset: const Offset(-55, 2),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text("by end of retirement",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 128, 128, 128))),
                  ),
                )
              ],
            ),
            Transform.translate(
                offset: const Offset(0, -0),
                child: Transform.scale(
                    scale: 1.1, child: const LineChartSample2())),
            const Positioned(
                bottom: 20.0,
                child: Row(
                  children: [
                    SizedBox(width: 18.0),
                    Text(
                      "2025",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xff000000)),
                    ),
                    SizedBox(width: 22.0),
                    Text(
                      "2035",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xff000000)),
                    ),
                    SizedBox(width: 22.0),
                    Text(
                      "2045",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xff000000)),
                    ),
                    SizedBox(width: 22.0),
                    Text(
                      "2055",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xff000000)),
                    ),
                    SizedBox(width: 22.0),
                    Text(
                      "2065",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xff000000)),
                    ),
                    SizedBox(width: 22.0),
                    Text(
                      "2075",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xff000000)),
                    )
                  ],
                ))
          ],
        ),
        Transform.translate(
          offset: const Offset(0, -4),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 282.0,
            decoration: const BoxDecoration(
                color: Color(0xffFDFDF5),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(30, 100, 100, 111),
                      offset: Offset(0, -20.0),
                      blurRadius: 12.0,
                      spreadRadius: 0)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.0),
                Padding(
                  padding: EdgeInsets.only(left: 22.0),
                  child: Text(
                    "Initial Retirement Assets (by 2045)",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 6.0),
                Padding(
                  padding: EdgeInsets.only(left: 22.0),
                  child: Text(
                    "\$2,885,886.18",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.only(left: 22.0),
                  child: Text(
                    "Initial Monthly Retirement Expenses",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 6.0),
                Padding(
                  padding: EdgeInsets.only(left: 22.0),
                  child: Text(
                    "\$13,660.43",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.only(left: 22.0),
                  child: Text(
                    "Balance (by end of 2075)",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 6.0),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "-\$5,310,816.24",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
