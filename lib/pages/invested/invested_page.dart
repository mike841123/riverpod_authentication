import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll/pages/invested/providers/invested_providers.dart';
import 'package:infinite_scroll/pages/invested/state/invested_state.dart';
import 'package:infinite_scroll/pages/invested/widgets/coin_item.dart';
import '../../domain/response/save_coin_response/save_coin_rate_response.dart';

class InvestedPage extends ConsumerStatefulWidget {
  const InvestedPage({super.key});

  @override
  ConsumerState<InvestedPage> createState() => _InvestedPageState();
}

class _InvestedPageState extends ConsumerState<InvestedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("invested"),
      ),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: "",
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.fitWidth,
            ),
            Consumer(builder: (context, ref, child) {
              final investedState = ref.watch(investedProvider);
              final List<RateInfo> usdt = investedState.saveCoinRateResponse?.data?.USDT ?? [];
              final List<RateInfo> fil = investedState.saveCoinRateResponse?.data?.FIL ?? [];
              switch (investedState.status) {
                case InvestedPageStatus.initial:
                  return const Center(child: CircularProgressIndicator());
                case InvestedPageStatus.success:
                  return Column(
                    children: [
                      const Gap(20),
                      CoinItem(
                        coinType: CoinType.usdt,
                        rateInfoList: usdt,
                        selectedIndex: investedState.usdtItemSelectedIndex,
                        onTap: (value) {
                          ref.watch(investedProvider.notifier).updateUsdtSelectedIndex(value ?? 0);
                        },
                      ),
                      const Gap(20),
                      CoinItem(
                        coinType: CoinType.fil,
                        rateInfoList: fil,
                        selectedIndex: investedState.filItemSelectedIndex,
                        onTap: (value) {
                          ref.watch(investedProvider.notifier).updateFilSelectedIndex(value ?? 0);
                        },
                      ),
                    ],
                  );
                default:
                  return const Center(child: Text("錯誤"));
              }
            }),
          ],
        ),
      ),
    );
  }
}
