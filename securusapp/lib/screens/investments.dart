import 'package:flutter/material.dart';

class InvestmentsScreen extends StatefulWidget {
  const InvestmentsScreen({super.key});

  State<InvestmentsScreen> createState() => _InvestmentsScreenState();
}

class _InvestmentsScreenState extends State<InvestmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 80.0),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text("Investments",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
          ),
        ),
        const SizedBox(height: 20.0),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: 340.0,
                    height: 120.0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 18.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 215, 255, 230),
                        border: Border.all(
                            color: const Color.fromARGB(255, 35, 103, 74),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "iShares Core MSCI EM ETF",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            Text(
                              "IEMG",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 158, 158, 158)),
                            )
                          ],
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "Risk: Lowest",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13.0),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "Recommended Monthly Investment:",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13.0),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "\$257.18",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        )
                      ],
                    )),
                const SizedBox(height: 15.0),
                Container(
                    width: 340.0,
                    height: 120.0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 18.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 215, 255, 230),
                        border: Border.all(
                            color: const Color.fromARGB(255, 35, 103, 74),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SPDR Gold Shares",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            Text(
                              "GLD",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 158, 158, 158)),
                            )
                          ],
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "Risk: Lowest",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13.0),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "Recommended Monthly Investment:",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13.0),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "\$242.82",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        )
                      ],
                    )),
                const SizedBox(height: 15.0),
                Container(
                    width: 340.0,
                    height: 120.0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 18.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 215, 215),
                        border: Border.all(
                            color: const Color.fromARGB(255, 35, 103, 74),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SPDR S&P 500 ETF Trust",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            Text(
                              "SPY",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 158, 158, 158)),
                            )
                          ],
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "Risk: Not Suitable",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13.0),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "Recommended Monthly Investment:",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13.0),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "Not Suitable",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        )
                      ],
                    )),
                const SizedBox(height: 15.0),
                Container(
                    width: 340.0,
                    height: 120.0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 18.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 215, 215),
                        border: Border.all(
                            color: const Color.fromARGB(255, 35, 103, 74),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "iShares MSCI EAFE ETF",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            Text(
                              "EFA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 158, 158, 158)),
                            )
                          ],
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "Risk: Not Suitable",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13.0),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "Recommended Monthly Investment:",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13.0),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "Not Suitable",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        )
                      ],
                    )),
                const SizedBox(height: 15.0),
                Container(
                    width: 340.0,
                    height: 120.0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 18.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 215, 215),
                        border: Border.all(
                            color: const Color.fromARGB(255, 35, 103, 74),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "iShares Core US AG Bond ETF",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            Text(
                              "AGG",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 158, 158, 158)),
                            )
                          ],
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "Risk: Not Suitable",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13.0),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "Recommended Monthly Investment:",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13.0),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "Not Suitable",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
