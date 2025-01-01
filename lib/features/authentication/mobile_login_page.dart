import 'package:flutter/material.dart';
import 'package:flutter_study/core/constants/styles.dart';
import 'package:flutter_study/core/gen/assets.gen.dart';
import 'package:flutter_study/core/widgets/image_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MobileLoginPage extends StatefulWidget {
  MobileLoginPage({super.key});

  var model = MobileLoginViewModel();

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MobileLoginViewModel>.value(
      value: widget.model,
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            backgroundWall(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 35, right: 35),
                child: sloganArea(),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 190, left: 35, right: 35),
                child: inputArea(),
              ),
            )
          ],
        ),
      ),
    );
  }

  // 输入模块
  Widget inputArea() {
    return Column(
      children: [
        Row(
          children: [
            // 手机号输入框
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Container(
                      height: 50,
                      color: Styles.c_F6F6F9,
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "未注册手机号验证后自动登录",
                      style: Styles.ts_999999_f12_w400,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),
        // 获取验证码按钮
        Row(
          children: [
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: Container(
                color: Styles.c_B381D9,
                height: 50,
              ),
            )),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: agreementBox()),
          ],
        )
      ],
    );
  }

  /// 背景墙
  Widget backgroundWall() {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Stack(
            children: [
              ImageView(
                path: Assets.images.login.loginBackground2x.path,
                width: ScreenUtil().screenWidth,
                height: 260,
                fit: BoxFit.fill,
              ),
            ],
          )
        ],
      ),
    );
  }

  // 欢迎标语
  Widget sloganArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: ImageView(path: Assets.images.login.loginWelcomeText.path),
        ),
        const SizedBox(height: 15),
        ImageView(path: Assets.images.login.loginAppName.path, width: 128, height: 30),
      ],
    );
  }

  // 同意协议
  Widget agreementBox() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(8),
          child: Selector<MobileLoginViewModel, bool>(
            /* Selector 精确监听、重构部份内容 */
            builder: (context, isAgree, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 1200),
                curve: Curves.linear,
                child: ImageView(
                  path: isAgree
                      ? Assets.images.login.loginCheckmarkChecked.path
                      : Assets.images.login.loginCheckmarkUncheck.path,
                  width: 12,
                  height: 12,
                ),
              );
            },
            selector: (_, model) => model.isAgree,
          ),
        ),
        onTap: () {
          var isAgree = widget.model.isAgree;
          widget.model.setAgree(!isAgree);
        },
      ),
      Row(
        children: [
          RichText(
              softWrap: true,
              overflow: TextOverflow.clip,
              text: TextSpan(children: [
                TextSpan(text: "阅读并同意我们的", style: Styles.ts_333333_f11_w400),
                TextSpan(
                  text: "《服务协议与隐私条款》",
                  style: Styles.ts_B381D9_f11_w400,
                )
              ])),
        ],
      )
    ]);
  }
}

class MobileLoginViewModel extends ChangeNotifier {
  // 是否已经同意协议
  bool isAgree = false;

  // 设置是否已经同意协议
  void setAgree(bool isAgree) {
    this.isAgree = isAgree;
    notifyListeners();
  }
}
