import 'package:flutter/material.dart';
import 'package:flutter_study/core/gen/assets.gen.dart';
import 'package:flutter_study/core/widgets/image_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({super.key});

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundWall(),
        Positioned(
            left: 32,
            top: 68,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text(
                      "Hi, 欢迎来到",
                      style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(child: ImageView(path: Assets.images.login.loginAppName.path, width: 128, height: 30)),
                ],
              ),
            )),
      ],
    );
  }

  // 背景墙
  Container backgroundWall() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.red,
            child: Stack(
              children: [
                ImageView(
                  path: Assets.images.login.loginBacground.path,
                  width: ScreenUtil().screenWidth,
                  height: 260,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  child: ImageView(
                    path: Assets.images.login.loginGradient.path,
                    width: ScreenUtil().screenWidth,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 88,
                  right: 42,
                  child: ImageView(
                    path: Assets.images.login.loginBacgroundLogo.path,
                    width: 107,
                    height: 107,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
