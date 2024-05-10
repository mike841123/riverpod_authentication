import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class BorderDialog extends StatelessWidget {
  const BorderDialog({
    super.key,
    required this.dialogTitle, required this.contentWidget, required this.bottomWidget,
  });

  final String dialogTitle;
  final Widget contentWidget;
  final Widget bottomWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 380,
          decoration: BoxDecoration(color: Color(0xcc011934), border: Border.all(color: Color(0xff0566a7), width: 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xff0566a7), width: 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dialogTitle,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff86c2f2),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(Icons.close, color: Color(0xff86c2f2)))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xff0566a7), width: 2),
                  ),
                ),
                child: contentWidget,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: bottomWidget,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
