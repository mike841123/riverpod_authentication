import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/pages/flow/providers/flow_providers.dart';
import 'package:infinite_scroll/pages/flow/state/flow_state.dart';
import '../../domain/request/member_page_request/asset_info_list_request.dart';
import '../../domain/response/flow_page_response/asset_info_list_response.dart';
import 'component/flow_item.dart';

class FlowPage extends StatefulWidget {
  const FlowPage({super.key});

  @override
  State<FlowPage> createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flow"),
      ),
      body: Consumer(builder: (context, ref, child) {
        final flowState = ref.watch(flowProvider);
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2<FundsTransferLabel>(
                  isDense: true,
                  items: flowState.fundsTransferList.map<DropdownMenuItem<FundsTransferLabel>>((FundsTransferLabel data) {
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
                  value: flowState.fundsTransferSelectLabel,
                  hint: const Text("請選擇"),
                  onChanged: (FundsTransferLabel? value) {
                    ref.read(flowProvider.notifier).updateDropdown(value!);
                  },
                  isExpanded: true,
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    offset: const Offset(-20, 0),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    padding: const EdgeInsets.only(left: 14, right: 14),
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
              Consumer(builder: (context, ref, child) {
                final flowState = ref.watch(flowProvider);
                final List<AssetInfo> assetInfo = flowState.assetInfo;
                switch (flowState.status) {
                  // api未回傳前顯示loading
                  case FlowPageStatus.initial:
                    return const Center(child: CircularProgressIndicator());
                  // api回傳成功
                  case FlowPageStatus.success:
                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          if (index == assetInfo.length - 1) {
                            /// 當未到達最後一筆就繼續取10筆
                            if (assetInfo.length < flowState.total) {
                              ref.read(flowProvider.notifier).updateFlowList(
                                  AssetInfoListRequest(page: flowState.currPage + 1, limit: limit, type: flowState.fundsTransferSelectLabel!.label.type));
                              //加载时显示loading
                              return Container(
                                alignment: Alignment.center,
                                child: const SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: CircularProgressIndicator(strokeWidth: 2.0),
                                ),
                              );
                            }
                          }
                          return FlowItem(title: assetInfo[index].title ?? "", date: assetInfo[index].title ?? "", price: assetInfo[index].price ?? 0);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: assetInfo.length,
                      ),
                    );
                  default:
                    return const Center(child: Text("發生錯誤"));
                }
              })
            ],
          ),
        );
      }),
    );
  }
}
