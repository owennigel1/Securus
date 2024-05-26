import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:securusapp/screens/questionnaire.dart';
import 'package:securusapp/widgets/sappbar.dart';
import 'package:securusapp/widgets/sbutton.dart';
import 'package:securusapp/widgets/sdateselector.dart';
import 'package:securusapp/widgets/sinputfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int pageIndex = 0;
  DateTime? date;

  final TextEditingController nameFieldController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PageController formPageController = PageController();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SAppBar(
              title: "Create your account",
              titleSize: 22.0,
              onTapBack: () {
                if (pageIndex == 0) return;
                formPageController.previousPage(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeInOutCubic);
                setState(() {
                  pageIndex--;
                });
              },
            ),
            SizedBox(
              height: 300.0,
              child: PageView(
                controller: formPageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(children: [
                    SInputField(
                      title: "Full Name",
                      placeholder: "Bryan Soong",
                      controller: nameFieldController,
                    )
                  ]),
                  Column(children: [
                    SInputField(
                      title: "Email address",
                      placeholder: "bryansoong35@gmail.com",
                      controller: emailController,
                    )
                  ]),
                  Column(children: [
                    SInputField(
                      title: "Password",
                      placeholder: "•••••••••••••••••",
                      controller: passwordFieldController,
                      secret: true,
                    ),
                  ]),
                  Column(children: [
                    SDateSelector(
                        title: "Date of Birth",
                        date: date,
                        onTap: () => _showDialog(
                              CupertinoDatePicker(
                                initialDateTime: date,
                                mode: CupertinoDatePickerMode.date,
                                use24hFormat: true,
                                // This shows day of week alongside day of month
                                showDayOfWeek: false,
                                // This is called when the user changes the date.
                                onDateTimeChanged: (DateTime newDate) {
                                  setState(() => date = newDate);
                                },
                              ),
                            ))
                  ])
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: SButton(
                    title: pageIndex <= 2 ? "Proceed" : "Create account",
                    onTap: () {
                      if (pageIndex >= 3) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => const QuestionnaireScreen()));
                      }

                      formPageController.nextPage(
                          duration: const Duration(milliseconds: 180),
                          curve: Curves.easeInOutCubic);
                      setState(() {
                        pageIndex++;
                      });
                    },
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
