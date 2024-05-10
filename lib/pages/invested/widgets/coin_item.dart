import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll/pages/invested/widgets/save_dialog.dart';
import '../../../domain/response/public_response/digital_bank_response.dart';
import '../../../domain/response/save_coin_response/save_coin_rate_response.dart';
import '../../../model/providers/user_providers.dart';
import '../state/invested_state.dart';

class CoinItem extends StatelessWidget {
  const CoinItem({super.key, required this.rateInfoList, required this.selectedIndex, this.onTap, required this.coinType});

  final List<RateInfo> rateInfoList;
  final int selectedIndex;
  final Function(int? value)? onTap;
  final CoinType coinType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple[200],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.circle_notifications),
              Gap(10),
              Text("FIL"),
            ],
          ),
          const Gap(20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (int i = 0; i < rateInfoList.length; i++)
                SizedBox(
                  width: 100,
                  height: 40,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          _btnFun(i);
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
                              rateInfoList[i].legalDays.toString(),
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
          const Gap(20),
          const Text("年利率："),
          Text("年利率："),
          const Gap(20),
          Consumer(builder: (context, ref, child) {
            return Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final userState = await ref.read(userProvider.notifier).getDigitalBank();
                    double usdtBalance = userState.chainInfo.singleWhere((element) => element.assetTypeId == CoinType.usdt.value, orElse: () {
                      return ChainInfo();
                    }).balance;
                    if (!context.mounted) return;
                    showSaveDialog(context, rateInfoList, selectedIndex, coinType, onTap, usdtBalance);
                  },
                  child: const Text("存幣"),
                ),
                const Gap(6),
                ElevatedButton(onPressed: () {}, child: const Text("紀錄")),
              ],
            );
          }),
        ],
      ),
    );
  }

  void _btnFun(int value) {
    onTap?.call(value);
  }

  void showSaveDialog(
      BuildContext buildContext, List<RateInfo> rateInfoList, int selectedIndex, CoinType coinType, Function(int? value)? onTap, double balance) {
    showDialog(
      context: buildContext,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (_) => SaveDialog(
        rateInfoList: rateInfoList,
        selectedIndex: selectedIndex,
        coinType: coinType,
        onTap: onTap,
        balance: balance,
      ),
    );
  }
}
