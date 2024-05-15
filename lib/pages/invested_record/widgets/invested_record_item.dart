import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:infinite_scroll/component/border_dialog.dart';
import 'package:infinite_scroll/component/check_widget.dart';
import 'package:infinite_scroll/pages/invested_record/providers/invested_record_providers.dart';
import 'package:infinite_scroll/pages/invested_record/state/invested_record_state.dart';

import '../../../domain/response/save_coin_response/save_coin_history_response.dart';
import '../../../util/widget_util.dart';

class InvestedRecordItem extends ConsumerWidget {
  const InvestedRecordItem({super.key, required this.record, required this.index});

  final SaveCoinHistory record;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CheckController isAutoSubscribe = CheckController();
    isAutoSubscribe.status = record.autoSubscribe == 0 ? false : true;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff29305e),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          tableItem(title: "num", content: index.toString(), borderWidth: 4),
          tableItem(title: "num", content: (index ~/ 10 + 1).toString(), borderWidth: 4),
          tableItem(title: "訂單編號", content: record.orderId, borderWidth: 4),
          tableItem(title: "幣種", content: record.assetType.toString()),
          tableItem(title: "存幣金額", content: record.investedAmount.toStringAsFixed(5)),
          tableItem(title: "訂單狀態", content: _getStatus(record.status)),
          tableItem(
              title: "贖回",
              content: "",
              opBtnTitle: record.status == OrderType.op2.type ? "贖回" : "",
              opTap: () {
                print(record.currentPage);
              }),
          tableItem(
            title: "更多",
            content: "",
            opBtnTitle: "查看明細",
            isShowLine: false,
            opTap: () {
              print(index);
              // SmartDialog.show(
              //   builder: (_) {
              //     return DetailsDialog(
              //       record: record,
              //     );
              //   },
              // );
            },
          ),
          CheckWidget(
            isAutoSubscribe,
            text: "自動續存",
            onTap: (value) {
              if (value != null) {
                ref.read(investedRecordProvider.notifier).updateAutoSubscribe(record.id, value ? 1 : 0, index ~/ 10 + 1);
              }
            },
          ),
        ],
      ),
    );
  }

  String _getStatus(int status) {
    switch (status) {
      case 1:
        return OrderType.op1.title;
      case 2:
        return OrderType.op2.title;
      case 3:
        return OrderType.op3.title;
      case 4:
        return OrderType.op4.title;
      default:
        return "";
    }
  }
}

class DetailsDialog extends ConsumerWidget {
  const DetailsDialog({super.key, required this.record});

  final SaveCoinHistory record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CheckController isAutoSubscribe = CheckController();
    isAutoSubscribe.status = record.autoSubscribe == 0 ? false : true;
    return BorderDialog(
      dialogTitle: "查看",
      contentWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _contentItem("訂單編號", record.orderId),
          _contentItem("幣種", "i1212"),
          _contentItem("存幣金額", "i1212"),
          _contentItem("訂單編號", "i1212"),
          _contentItem("訂單編號", "i1212", isNeedPadding: false),
        ],
      ),
      bottomWidget: Container(
        alignment: Alignment.centerLeft,
        child: CheckWidget(
          isAutoSubscribe,
          text: "自動續存",
          onTap: (value) {
            if (value != null) {
              ref.read(investedRecordProvider.notifier).updateAutoSubscribe(record.id, value ? 1 : 0, record.currentPage ?? 0);
            }
          },
        ),
      ),
    );
  }

  Widget _contentItem(String title, String content, {bool isNeedPadding = true}) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.only(bottom: isNeedPadding ? 6 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(content),
          ],
        ),
      ),
    );
  }
}
