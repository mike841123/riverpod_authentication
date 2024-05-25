import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll/pages/insurance_management/providers/insurance_management_providers.dart';
import 'package:infinite_scroll/pages/insurance_management/state/insurance_management_state.dart';
import 'package:infinite_scroll/pages/insurance_management/widgets/insurance_order_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../config/routes/routes_location.dart';

class InsuranceManagementPage extends ConsumerStatefulWidget {
  const InsuranceManagementPage({super.key});

  @override
  ConsumerState<InsuranceManagementPage> createState() => _InsuranceManagementPageState();
}

class _InsuranceManagementPageState extends ConsumerState<InsuranceManagementPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(insuranceManagementProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("insurance_management"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.push(RouteLocation.insuranceRegister);
              },
              child: Text("去保險登記"),
            ),
            const Gap(14),
            Consumer(builder: (context, ref, child) {
              switch (state.status) {
                // api未回傳前顯示loading
                case InsuranceManagementPageStatus.initial:
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                // api回傳成功
                case InsuranceManagementPageStatus.success:
                  return Expanded(
                    child: SmartRefresher(
                      enablePullUp: true,
                      enablePullDown: true,
                      controller: _refreshController,
                      onRefresh: () async {
                        await ref.read(insuranceManagementProvider.notifier).getInsuranceOrder(isInit: true);
                        _refreshController.refreshCompleted();
                      },
                      onLoading: () async {
                        if (state.isLoadMore) {
                          await ref.read(insuranceManagementProvider.notifier).getInsuranceOrder();
                          _refreshController.loadComplete();
                        }
                      },
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InsuranceOrder(
                            key: ObjectKey(index),
                            item: state.insuranceOrderList[index],
                          );
                        },
                        itemCount: state.insuranceOrderList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Gap(8);
                        },
                      ),
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
