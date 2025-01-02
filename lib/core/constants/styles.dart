// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Styles {
  Styles._();

  /// 紫主色
  static Color c_B381D9 = const Color(0xFFB381D9);

  static Color c_F6F6F9 = const Color(0xFFF6F6F9);
  static Color c_999999 = const Color(0xFF999999);
  static Color c_333333 = const Color(0xFF333333);

  // 基础配置, 理解为占位配置就行了。
  static TextStyle basic = TextStyle(
    color: Styles.c_333333,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static TextStyle ts_999999_f12_w400 = TextStyle(
    color: Styles.c_999999,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static TextStyle ts_333333_f11_w400 = TextStyle(
    color: Styles.c_333333,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static TextStyle ts_B381D9_f11_w400 = TextStyle(
    color: Styles.c_B381D9,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );
}
