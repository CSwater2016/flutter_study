// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageView extends StatelessWidget {
  ImageView({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.color,
    this.opacity = 1,
    this.fit,
  });

  final String path;
  double? width;
  double? height;
  Color? color;
  double opacity;
  BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    bool isSvg = path.endsWith('.svg');
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Opacity(
        opacity: opacity,
        child: isSvg
            ? SvgPicture.asset(
                path,
                width: width,
                height: height,
                fit: fit ?? BoxFit.contain,
                colorFilter: filter(),
              )
            : Image.asset(
                path,
                width: width,
                height: height,
                color: color,
                fit: fit,
              ),
      ),
    );
  }

  ColorFilter? filter() {
    return color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;
  }
}
