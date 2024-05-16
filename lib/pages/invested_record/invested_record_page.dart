import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll/pages/invested_record/providers/invested_record_providers.dart';
import 'package:infinite_scroll/pages/invested_record/state/invested_record_state.dart';
import 'package:infinite_scroll/pages/invested_record/widgets/invested_record_item.dart';
import 'package:infinite_scroll/pages/invested_record/widgets/select_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InvestedRecordPage extends ConsumerStatefulWidget {
  const InvestedRecordPage({super.key});

  @override
  ConsumerState<InvestedRecordPage> createState() => _InvestedRecordPageState();
}

class _InvestedRecordPageState extends ConsumerState<InvestedRecordPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(investedRecordProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("invested_record"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierColor: Colors.black.withOpacity(0.5),
                builder: (_) => const SelectDialog(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              switch (state.status) {
                // api未回傳前顯示loading
                case InvestedRecordPageStatus.initial:
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                // api回傳成功
                case InvestedRecordPageStatus.success:
                  return Expanded(
                    child: SmartRefresher(
                      enablePullUp: true,
                      enablePullDown: true,
                      controller: _refreshController,
                      onRefresh: () async {
                        await ref.read(investedRecordProvider.notifier).getInvestedRecord(isInit: true);
                        _refreshController.refreshCompleted();
                      },
                      onLoading: () async {
                        if (state.isLoadMore) {
                          await ref.read(investedRecordProvider.notifier).getInvestedRecord();
                          _refreshController.loadComplete();
                        }
                      },
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InvestedRecordItem(
                            key: ObjectKey(index),
                            index: index,
                            record: state.investedRecordList[index],
                          );
                        },
                        itemCount: state.investedRecordList.length,
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
