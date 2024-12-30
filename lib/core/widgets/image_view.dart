// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType {
  svg,
  png,
  jpg,
  undefined,
}

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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Opacity(
        opacity: opacity,
        child: buildAssetsContainer(),
      ),
    );
  }

  Widget buildAssetsContainer() {
    var imageType = _imageTypeFormPath(path);
    switch (imageType) {
      case ImageType.svg:
        return SvgPicture.asset(
          path,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          colorFilter: _filterFromColor(color),
        );
      case ImageType.png:
      case ImageType.jpg:
        return Image.asset(
          path,
          width: width,
          height: height,
          color: color,
          fit: fit,
        );
      case ImageType.undefined:
        // 返回一个黑色的方块，表示没有处理
        return Container(
          width: width,
          height: height,
          color: Colors.black,
        );
    }
  }
}

// MARK: - Tools

ColorFilter? _filterFromColor(Color? color) {
  if (color != null) {
    return ColorFilter.mode(color, BlendMode.srcIn);
  }
  return null;
}

ImageType _imageTypeFormPath(String path) {
  if (path.endsWith('.svg')) {
    return ImageType.svg;
  } else if (path.endsWith('.png')) {
    return ImageType.png;
  } else if (path.endsWith('.jpg')) {
    return ImageType.jpg;
  } else {
    return ImageType.undefined;
  }
}
