/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/login
  $AssetsImagesLoginGen get login => const $AssetsImagesLoginGen();

  /// Directory path: assets/images/main_tab
  $AssetsImagesMainTabGen get mainTab => const $AssetsImagesMainTabGen();
}

class $AssetsImagesLoginGen {
  const $AssetsImagesLoginGen();

  /// File path: assets/images/login/login_app_name.svg
  SvgGenImage get loginAppName => const SvgGenImage('assets/images/login/login_app_name.svg');

  /// File path: assets/images/login/login_bacground_logo.svg
  SvgGenImage get loginBacgroundLogo => const SvgGenImage('assets/images/login/login_bacground_logo.svg');

  /// File path: assets/images/login/login_background@2x.png
  AssetGenImage get loginBackground2x => const AssetGenImage('assets/images/login/login_background@2x.png');

  /// File path: assets/images/login/login_checkmark_checked.svg
  SvgGenImage get loginCheckmarkChecked => const SvgGenImage('assets/images/login/login_checkmark_checked.svg');

  /// File path: assets/images/login/login_checkmark_uncheck.svg
  SvgGenImage get loginCheckmarkUncheck => const SvgGenImage('assets/images/login/login_checkmark_uncheck.svg');

  /// File path: assets/images/login/login_welcome_text.svg
  SvgGenImage get loginWelcomeText => const SvgGenImage('assets/images/login/login_welcome_text.svg');

  /// List of all assets
  List<dynamic> get values => [
        loginAppName,
        loginBacgroundLogo,
        loginBackground2x,
        loginCheckmarkChecked,
        loginCheckmarkUncheck,
        loginWelcomeText
      ];
}

class $AssetsImagesMainTabGen {
  const $AssetsImagesMainTabGen();

  /// File path: assets/images/main_tab/main_tab_calender_selected.svg
  SvgGenImage get mainTabCalenderSelected => const SvgGenImage('assets/images/main_tab/main_tab_calender_selected.svg');

  /// File path: assets/images/main_tab/main_tab_calender_unselected.svg
  SvgGenImage get mainTabCalenderUnselected =>
      const SvgGenImage('assets/images/main_tab/main_tab_calender_unselected.svg');

  /// File path: assets/images/main_tab/main_tab_course_selected.svg
  SvgGenImage get mainTabCourseSelected => const SvgGenImage('assets/images/main_tab/main_tab_course_selected.svg');

  /// File path: assets/images/main_tab/main_tab_course_unselected.svg
  SvgGenImage get mainTabCourseUnselected => const SvgGenImage('assets/images/main_tab/main_tab_course_unselected.svg');

  /// File path: assets/images/main_tab/main_tab_mine_selected.svg
  SvgGenImage get mainTabMineSelected => const SvgGenImage('assets/images/main_tab/main_tab_mine_selected.svg');

  /// File path: assets/images/main_tab/main_tab_mine_unselected.svg
  SvgGenImage get mainTabMineUnselected => const SvgGenImage('assets/images/main_tab/main_tab_mine_unselected.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        mainTabCalenderSelected,
        mainTabCalenderUnselected,
        mainTabCourseSelected,
        mainTabCourseUnselected,
        mainTabMineSelected,
        mainTabMineUnselected
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
