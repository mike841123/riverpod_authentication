import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../domain/response/insurance_page_response/insurance_order_response.dart';
import '../../../util/widget_util.dart';

class InsuranceOrder extends StatelessWidget {
  const InsuranceOrder({super.key, required this.item});

  final InfoPageItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff29305e),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          tableItem(title: "訂單編號", content: item.id.toString(), borderWidth: 4),
          tableItem(title: "保險類別", content: item.insuranceCategoryName),
          tableItem(title: "保單名稱", content: item.insuranceTypeName),
          tableItem(title: "金額", content: item.amount.toStringAsFixed(5)),
          tableItem(title: "有效期間", content: item.endDate, isShowLine: false),
        ],
      ),
    );
  }
}
