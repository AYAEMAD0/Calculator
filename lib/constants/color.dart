import 'package:flutter/material.dart';

class AppColors {
  // خلفية التطبيق
  static Color background(bool isDark) =>
      isDark ? const Color(0xff17171c) : const Color(0xfff1f2f3);

  static Color topButtons(bool isDark) =>
      isDark ? const Color(0xff4e505f) : const Color(0xffd2d3da);

  // أزرار العمليات: +, -, *, /
  static const Color operationButton = Color(0xff4B5EFC);

  // أزرار الأرقام
  static Color numberButton(bool isDark) =>
      isDark ? const Color(0xff2e2f38) : Colors.white;

  // لون النص داخل الزر
  static Color textColor(bool isDark, int index) =>
      (isDark || index % 4 == 3) ? Colors.white : Colors.black;

  // لون النص في مدخل المستخدم
  static Color inputTextColor(bool isDark) =>
      isDark ? const Color(0xFF7A7A99) : const Color(0xff919192);

  // لون خلفية زر تغيير الوضع
  static Color toggleButtonBackground(bool isDark) =>
      isDark ? const Color(0xff2e2f38) : Colors.white;
}
