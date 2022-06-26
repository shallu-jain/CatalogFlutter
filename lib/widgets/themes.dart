import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) =>
      ThemeData(
        primarySwatch: Colors.red,
        canvasColor: creamColor,
        cardColor: Colors.white,
        // buttonColor: darkBluishColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme
              .of(context)
              .textTheme
              .bodyText1,
          titleTextStyle: Theme
              .of(context)
              .textTheme
              .headline6,
        ),
      );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(
        canvasColor: darkCreamColor,
        cardColor: Colors.black,
        // buttonColor: lightBluishColor,
        // brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme
              .of(context)
              .textTheme
              .bodyText1,
          titleTextStyle: Theme
              .of(context)
              .textTheme
              .headline6,
        ),
      );

  // Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Colors.grey.shade900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Colors.purple.shade400;


}
