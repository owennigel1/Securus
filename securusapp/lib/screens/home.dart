import 'package:flutter/material.dart';
import 'package:securusapp/screens/dashboard.dart';
import 'package:securusapp/screens/expenditure.dart';
import 'package:securusapp/screens/investments.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          unselectedItemColor: const Color.fromARGB(255, 124, 124, 124),
          selectedItemColor: const Color.fromARGB(255, 149, 203, 105),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (value) {
            _pageController.animateToPage(value,
                duration: const Duration(milliseconds: 220),
                curve: Curves.decelerate);
            setState(() {
              _pageIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30.0,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pie_chart_outline_rounded,
                  size: 30.0,
                ),
                label: "Expenditure"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.trending_up_rounded,
                  size: 30.0,
                ),
                label: "Invest"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_rounded,
                  size: 30.0,
                ),
                label: "Profile"),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: const [
            DashboardScreen(),
            ExpenditureScreen(),
            InvestmentsScreen(),
            ExpenditureScreen(),
          ],
        ));
  }
}
