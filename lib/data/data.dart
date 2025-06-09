
import 'package:flutter/material.dart';

class Data {
  static List<List> getValues(bool isDark) {
    return [
      ["C", "+/-", "%", "/"],
      ["7", "8", "9", "*"],
      ["4", "5", "6", "-"],
      ["1", "2", "3", "+"],
      [
        ".",
        "0",
        Image.asset(isDark
            ? "assets/images/Light/Union_delete_white.png"
            : "assets/images/Dark/Union_delete_dark.png"),
        "="
      ],
    ];
  }

  static List getFlatValues(bool isDark) {
    return getValues(isDark).expand((e) => e).toList();
  }
}






