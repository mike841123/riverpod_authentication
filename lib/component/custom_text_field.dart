import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

enum InputType {
  dark,
  light,
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.title,
      this.maxLines = 1,
      this.suffixIcon,
      this.readOnly = false,
      this.width,
      this.backWidget,
      this.inputType = InputType.light});

  final TextEditingController? controller;
  final String hintText;
  final String title;
  final int maxLines;
  final Widget? suffixIcon;
  final bool readOnly;
  final double? width;
  final Widget? backWidget;
  final InputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == ""
            ? Container()
            : Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: inputType == InputType.light ? Colors.black : Colors.white,
                    ),
                  ),
                  const Gap(10),
                ],
              ),
        TextField(
          readOnly: readOnly,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          autocorrect: false,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
