import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll/component/custom_text_field.dart';
import 'package:infinite_scroll/domain/request/save_coin_request/send_save_coin_request.dart';
import 'package:infinite_scroll/pages/invested/providers/invested_providers.dart';
import '../../../component/border_dialog.dart';
import '../../../component/check_widget.dart';
import '../../../domain/response/save_coin_response/save_coin_rate_response.dart';
import '../state/invested_state.dart';

class SaveDialog extends ConsumerStatefulWidget {
  const SaveDialog({
    super.key,
    required this.rateInfoList,
    required this.selectedIndex,
    required this.coinType,
    this.onTap,
    required this.balance,
  });

  final List<RateInfo> rateInfoList;
  final int selectedIndex;
  final CoinType coinType;
  final Function(int? value)? onTap;
  final double balance;

  @override
  ConsumerState<SaveDialog> createState() => _SaveDialogState();
}

class _SaveDialogState extends ConsumerState<SaveDialog> {
  int selectedIndex = 0;
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _savePwd = TextEditingController();
  final CheckController _check = CheckController();

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BorderDialog(
        dialogTitle: widget.coinType.name,
        contentWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "期限(天)",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Gap(10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (int i = 0; i < widget.rateInfoList.length; i++)
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                            });
                            widget.onTap?.call(i);
                          },
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blueAccent, width: selectedIndex == i ? 1.5 : 0),
                            ),
                            child: Center(
                              child: Text(
                                widget.rateInfoList[i].legalDays.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        selectedIndex == i
                            ? Positioned(
                                right: 0,
                                child: SvgPicture.asset(
                                  'assets/images/icon_btn_selected.svg',
                                  width: 20,
                                  height: 20,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
              ],
            ),
            const Gap(10),
            CustomTextField(
              controller: _amount,
              hintText: "輸入金額",
              title: "申購金額",
              inputType: InputType.dark,
            ),
            const Gap(10),
            const Gap(10),
            CustomTextField(
              controller: _savePwd,
              hintText: "輸入安全密碼",
              title: "",
              inputType: InputType.dark,
            ),
            const Gap(10),
            Text(
              "可用餘額：${widget.balance}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Gap(10),
            CheckWidget(
              _check,
              text: "是否自動",
            ),
          ],
        ),
        bottomWidget: ElevatedButton(
          onPressed: () {
            ref.read(investedProvider.notifier).saveCoin(
              SendSaveCoinRequest(id: widget.rateInfoList[selectedIndex].id, investedAmount: _amount.text, autoSubscribe: 0, payPassword: _savePwd.text),
              completedFunc: () {
                context.pop();
              },
            );
          },
          child: const Text("存幣"),
        ));
  }
}
