import 'package:flutter/material.dart';
import 'package:flutter_study/features/authentication/mobile_login_page.dart';
import 'package:flutter_study/features/home/home_page.dart';
import 'package:flutter_study/global_widgets/multi_tab_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(title: '功能测试列表'),
      home: const MobileLoginPage(),
    );
  }
}
