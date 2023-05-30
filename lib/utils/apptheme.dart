import 'package:flutter/material.dart';

class AppThemeState extends ChangeNotifier {
  var isDarkModeEnabled = false;
  void setLightTheme() {
    isDarkModeEnabled = false;
    notifyListeners();
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    notifyListeners();
  }
}

class AppTheme {
  // Private Constructor
  AppTheme._();
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 250, 244),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
            color: Colors.orange[800],
            fontSize: 25,
            fontWeight: FontWeight.w700),
        actionsIconTheme: IconThemeData(
          color: Colors.orange[800],
        ),
      ),
      listTileTheme: ListTileThemeData(
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700),
          tileColor: Colors.orange[800]?.withOpacity(0.2),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          iconColor: Colors.black),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.orange[800]))));
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black54,
      appBarTheme: const AppBarTheme(
        color: Colors.black54,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
          bodySmall: TextStyle(color: Colors.white60)),
      listTileTheme: ListTileThemeData(
          tileColor: Colors.orange[800]?.withOpacity(0.7),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          iconColor: Colors.black),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.orange[800]))));
}
