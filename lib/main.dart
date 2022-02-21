import 'package:covid_onboard/feature/onboard/view/onboard_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            // colorScheme: ColorScheme(primary: Colors.red, primaryVariant: primaryVariant, secondary: secondary, secondaryVariant: secondaryVariant, surface: surface, background: background, error: error, onPrimary: onPrimary, onSecondary: onSecondary, onSurface: onSurface, onBackground: onBackground, onError: onError, brightness: brightness),
            primaryColor: Color.fromARGB(255, 189, 78, 180)),
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: OnBoardScreen());
  }
}