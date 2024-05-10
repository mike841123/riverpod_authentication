import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// 空白高度 widget
/// [height] 高度
Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

/// 空白寬度 widget
/// [width] 寬度
Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

/// 空白 widget
Widget empty() {
  return const Offstage(); // 不佔空間也不會繪製的 widget
}

/// 空白背景按鈕風格
ButtonStyle transparentButtonStyle({double textHeight = 1, double borderRadius = 8.0, Color? onPrimary, BorderRadiusGeometry? borderRadiusGeometry}) {
  return ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: onPrimary,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    padding: EdgeInsets.zero,
    textStyle: TextStyle(height: textHeight),
    //避免文字被切
    shape: RoundedRectangleBorder(
      borderRadius: borderRadiusGeometry ?? BorderRadius.circular(borderRadius),
    ),
  );
}