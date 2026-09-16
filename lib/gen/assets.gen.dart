// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsAuthGen {
  const $AssetsAuthGen();

  /// File path: assets/auth/back_chevron.svg
  SvgGenImage get backChevron =>
      const SvgGenImage('assets/auth/back_chevron.svg');

  /// File path: assets/auth/eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/auth/eye.svg');

  /// File path: assets/auth/login_logo.png
  AssetGenImage get loginLogo =>
      const AssetGenImage('assets/auth/login_logo.png');

  /// File path: assets/auth/upload_image.svg
  SvgGenImage get uploadImage =>
      const SvgGenImage('assets/auth/upload_image.svg');

  /// List of all assets
  List<dynamic> get values => [backChevron, eye, loginLogo, uploadImage];
}

class $AssetsSplashGen {
  const $AssetsSplashGen();

  /// File path: assets/splash/splash_android12_branding.png
  AssetGenImage get splashAndroid12Branding =>
      const AssetGenImage('assets/splash/splash_android12_branding.png');

  /// File path: assets/splash/splash_android12_combined.png
  AssetGenImage get splashAndroid12Combined =>
      const AssetGenImage('assets/splash/splash_android12_combined.png');

  /// File path: assets/splash/splash_android12_combined_dark.png
  AssetGenImage get splashAndroid12CombinedDark =>
      const AssetGenImage('assets/splash/splash_android12_combined_dark.png');

  /// File path: assets/splash/splash_android12_logo.png
  AssetGenImage get splashAndroid12Logo =>
      const AssetGenImage('assets/splash/splash_android12_logo.png');

  /// File path: assets/splash/splash_android_pre12.png
  AssetGenImage get splashAndroidPre12 =>
      const AssetGenImage('assets/splash/splash_android_pre12.png');

  /// File path: assets/splash/splash_android_pre12_dark.png
  AssetGenImage get splashAndroidPre12Dark =>
      const AssetGenImage('assets/splash/splash_android_pre12_dark.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    splashAndroid12Branding,
    splashAndroid12Combined,
    splashAndroid12CombinedDark,
    splashAndroid12Logo,
    splashAndroidPre12,
    splashAndroidPre12Dark,
  ];
}

abstract final class Assets {
  static const $AssetsAuthGen auth = $AssetsAuthGen();
  static const $AssetsSplashGen splash = $AssetsSplashGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

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
    _svg.ColorMapper? colorMapper,
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
        colorMapper: colorMapper,
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
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
