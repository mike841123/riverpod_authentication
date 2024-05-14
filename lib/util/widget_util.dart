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
    foregroundColor: onPrimary,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    padding: EdgeInsets.zero, // 消除按鈕內距
    minimumSize: Size.zero, // 消除按鈕內距
    textStyle: const TextStyle(height: 0),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 消除按鈕外距
    //避免文字被切
    shape: RoundedRectangleBorder(
      borderRadius: borderRadiusGeometry ?? BorderRadius.circular(borderRadius),
    ),
  );
}

Widget commonBtn({required String title, required Color bgColor, Function()? onTap, double height = 30}) {
  return SizedBox(
    height: height,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget tableItem({required String title, required String content, double? borderWidth, bool isShowLine = true, String opBtnTitle = "", Function()? opTap}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
        border: Border(
      bottom: BorderSide(color: isShowLine ? Color(0xFF1599f2) : Colors.transparent, width: isShowLine ? borderWidth ?? 1 : 0),
    )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        opBtnTitle.isEmpty
            ? Text(
                content,
                style: TextStyle(color: Colors.white),
              )
            : commonBtn(
                title: opBtnTitle,
                bgColor: Colors.blue,
                onTap: opTap,
              ),
      ],
    ),
  );
}
