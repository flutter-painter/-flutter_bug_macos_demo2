import 'package:flutter/material.dart';

final buttonColor = Color(0xFF0097A7);

final defaultStyle = TextStyle(
    fontSize: 28,
    fontFamily: 'Roboto',
    color: Colors.black,
    decoration: TextDecoration.none);

final yobiTheme = ThemeData(
  //unselectedWidgetColor: Colors.grey,

  appBarTheme: AppBarTheme(
    color: Color(0xFF20272B),
  ),
  accentColor: buttonColor,
  primaryColor: Color(0xFF20272B),
  buttonTheme: ButtonThemeData(
    buttonColor: buttonColor,
    textTheme: ButtonTextTheme.primary,
  ),
  indicatorColor: Color(0xfffffe9d),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
            color: Color(0xfffffe9d), width: 8, style: BorderStyle.solid),
      ),
      color: Color(0xFF20272B),
    ),
  ),
);

  List<Color> mainViewColors = [
  Colors.orange[800],
  Colors.blue[800],
  Colors.blue[400],
  Colors.red[800],
  Colors.pink[600],
  Colors.blueGrey[200],
  Colors.blueGrey,
  Colors.purple[800],
  Colors.teal,
];
