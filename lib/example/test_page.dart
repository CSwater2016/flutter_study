import 'package:flutter/material.dart';
import 'package:flutter_study/core/constants/styles.dart';
import 'package:flutter_study/example/basic_widgets/textfield_study.dart';
import 'package:flutter_study/features/authentication/mobile_login_page.dart';

// 测试页面

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    Text(
      '测试页面',
      style: Styles.basic,
    );
    return TextFieldStudy();
  }
}
