import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';
import 'package:securusapp/widgets/sappbar.dart';
import 'package:securusapp/widgets/sbutton.dart';
import 'package:securusapp/widgets/scontainerbutton.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  double _currentAge = 40;
  int _pageIndex = 0;
  PageController _pageController = PageController();

  late StateMachineController _riveController;
  late SMINumber _riveTrigger;

  void _onInit(Artboard artboard) {
    _riveController = StateMachineController.fromArtboard(artboard, 'main')
        as StateMachineController;
    artboard.addController(_riveController);
    _riveTrigger =
        _riveController.findInput<double>("SliderNumber") as SMINumber;
    _riveTrigger.change(_currentAge);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Tell us more about yourself",
      "Link your financial account",
      "What are your retirement goals"
    ];

    return Scaffold(
      body: Column(
        children: [
          SAppBar(
            title: titles[_pageIndex],
            titleSize: 22.0,
            height: 210.0,
            onTapBack: () {
              if (_pageIndex <= 0) return;
              _pageController.previousPage(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeInOutCubic);
              setState(() {
                _pageIndex--;
              });
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 330,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                Column(
                  children: [
                    // const RiveAnimation.asset("assets/anim/age_form.riv"),
                    SizedBox(
                      width: 300.0,
                      height: 300.0,
                      child: Transform.scale(
                        scale: 1.5,
                        child: RiveAnimation.asset(
                          "assets/anim/age_form.riv",
                          fit: BoxFit.cover,
                          stateMachines: const ["main"],
                          onInit: _onInit,
                        ),
                      ),
                    ),
                    const Text("Expected retirement age",
                        style: TextStyle(fontSize: 16.0)),
                    const SizedBox(height: 10.0),
                    Text(
                      _currentAge.round().toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 40.0),
                    ),
                    SizedBox(
                      width: 370.0,
                      child: Slider(
                          value: _currentAge,
                          min: 0,
                          max: 100,
                          onChanged: (age) => setState(() {
                                _currentAge = age;
                                _riveTrigger.change(age);
                              })),
                    )
                  ],
                ),
                const Column(
                  children: [SButton(title: "Link bank account")],
                ),
                const Column(
                  children: [
                    SContainerButton(width: 340.0, height: 150.0),
                    SizedBox(height: 20.0),
                    SContainerButton(width: 340.0, height: 150.0),
                    SizedBox(height: 20.0),
                    SContainerButton(width: 340.0, height: 150.0),
                  ],
                )
              ],
            ),
          ),
          SButton(
              title: "Proceed",
              onTap: () {
                if (_pageIndex >= 2) return;
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeInOutCubic);
                setState(() {
                  _pageIndex++;
                });
              })
        ],
      ),
    );
  }
}
