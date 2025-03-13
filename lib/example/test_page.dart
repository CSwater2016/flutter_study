import 'package:flutter/material.dart';
import 'package:flutter_study/core/constants/styles.dart';
import 'package:flutter_study/example/basic_widgets/dynamic_tabs_study.dart';
import 'package:flutter_study/example/basic_widgets/extended_tabs_study.dart';
import 'package:flutter_study/example/basic_widgets/tab_bar_view_study.dart';
import 'package:flutter_study/example/basic_widgets/textfield_study.dart';
import 'package:flutter_study/features/authentication/mobile_login_page.dart';
import 'package:flutter_study/global_widgets/multi_tab_widgets.dart';

// 测试页面

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    Text(
      '测试页面',
      style: Styles.basic,
    );
    return const DynamicTabsStudy();
  }
}
