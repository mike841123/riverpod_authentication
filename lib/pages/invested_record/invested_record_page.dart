import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll/pages/invested_record/providers/invested_record_providers.dart';
import 'package:infinite_scroll/pages/invested_record/state/invested_record_state.dart';
import 'package:infinite_scroll/pages/invested_record/widgets/invested_record_item.dart';

import '../../component/date_picker.dart';
import '../../util/widget_util.dart';

class InvestedRecordPage extends ConsumerStatefulWidget {
  const InvestedRecordPage({super.key});

  @override
  ConsumerState<InvestedRecordPage> createState() => _InvestedRecordPageState();
}

class _InvestedRecordPageState extends ConsumerState<InvestedRecordPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    /// 監聽滑動，滾到底部時加載10筆資料
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
          ref.read(investedRecordProvider).isLock == false) {
        ref.read(investedRecordProvider.notifier).updateInvestedRecord();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(investedRecordProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("invested_record"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("幣種"),
                      const Gap(10),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<InvestedCoinTypeLabel>(
                          isDense: true,
                          items: state.coinTypeDropdownList.map<DropdownMenuItem<InvestedCoinTypeLabel>>((InvestedCoinTypeLabel data) {
                            return DropdownMenuItem(
                              value: data,
                              child: Builder(builder: (context) {
                                return Text(
                                  data.label.title,
                                  maxLines: 1,
                                );
                              }),
                            );
                          }).toList(),
                          value: state.coinTypeSelectedLabel,
                          hint: const Text("請選擇"),
                          onChanged: (InvestedCoinTypeLabel? value) {
                            ref.read(investedRecordProvider.notifier).updateCoinTypeSelected(value!);
                          },
                          isExpanded: true,
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("訂單狀態"),
                      const Gap(10),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<InvestedOrderTypeLabel>(
                          isDense: true,
                          items: state.orderTypeDropdownList.map<DropdownMenuItem<InvestedOrderTypeLabel>>((InvestedOrderTypeLabel data) {
                            return DropdownMenuItem(
                              value: data,
                              child: Builder(builder: (context) {
                                return Text(
                                  data.label.title,
                                  maxLines: 1,
                                );
                              }),
                            );
                          }).toList(),
                          value: state.orderTypeSelectedLabel,
                          hint: const Text("請選擇"),
                          onChanged: (InvestedOrderTypeLabel? value) {
                            ref.read(investedRecordProvider.notifier).updateOrderTypeSelected(value!);
                          },
                          isExpanded: true,
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: DatePicker(
                    hintText: "please select date",
                    title: "開始申購日期",
                    controller: state.startDate ?? TextEditingController(),
                    picker: Picker.date,
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: DatePicker(
                    hintText: "please select date",
                    title: "開始申購日期",
                    controller: state.endDate ?? TextEditingController(),
                    picker: Picker.date,
                  ),
                ),
              ],
            ),
            const Gap(4),
            Row(
              children: [
                commonBtn(
                    title: "搜索",
                    bgColor: Colors.blue,
                    onTap: () {
                      ref.read(investedRecordProvider.notifier).getInvestedRecord(1);
                    }),
                const Gap(4),
                commonBtn(
                    title: "清空條件",
                    bgColor: Colors.blue,
                    onTap: () {
                      ref.read(investedRecordProvider.notifier).clear();
                    }),
              ],
            ),
            const Gap(4),
            Consumer(builder: (context, ref, child) {
              switch (state.status) {
                // api未回傳前顯示loading
                case InvestedRecordPageStatus.initial:
                  return const Center(child: CircularProgressIndicator());
                // api回傳成功
                case InvestedRecordPageStatus.success:
                  return Expanded(
                    child: ListView.separated(
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        return InvestedRecordItem(
                          record: state.investedRecordList[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: state.investedRecordList.length,
                    ),
                  );
                default:
                  return const Center(child: Text("發生錯誤"));
              }
            }),
            const Gap(4),
          ],
        ),
      ),
    );
  }
}
