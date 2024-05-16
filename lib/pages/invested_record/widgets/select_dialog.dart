import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../component/date_picker.dart';
import '../../../util/widget_util.dart';
import '../providers/invested_record_providers.dart';
import '../state/invested_record_state.dart';

class SelectDialog extends ConsumerWidget {
  const SelectDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(investedRecordProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
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
              const Gap(10),
              Column(
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
              const Gap(10),
              DatePicker(
                hintText: "please select date",
                title: "開始申購日期",
                controller: state.startDate ?? TextEditingController(),
                picker: Picker.date,
              ),
              DatePicker(
                hintText: "please select date",
                title: "開始申購日期",
                controller: state.endDate ?? TextEditingController(),
                picker: Picker.date,
              ),
              const Gap(10),
              Row(
                children: [
                  commonBtn(
                      title: "搜索",
                      bgColor: Colors.blue,
                      onTap: () {
                        ref.read(investedRecordProvider.notifier).getInvestedRecord(isInit: true);
                        context.pop();
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
            ],
          ),
        ),
      ],
    );
  }
}