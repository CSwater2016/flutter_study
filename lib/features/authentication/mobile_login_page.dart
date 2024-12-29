import 'package:flutter/material.dart';
import 'package:flutter_study/core/gen/assets.gen.dart';
import 'package:flutter_study/core/widgets/image_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({super.key});

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(
        Assets.images.login.loginBacgroundLogo.path,
        width: 100,
        height: 100,
      ),
      Image.asset(
        Assets.images.login.loginBacground.path,
        width: 100,
        height: 100,
      ),
      ImageView(path: Assets.images.login.loginBacgroundLogo.path, width: 100, height: 100),
      ImageView(path: Assets.images.login.loginBacground.path, width: 100, height: 100)
    ]);
  }
}
