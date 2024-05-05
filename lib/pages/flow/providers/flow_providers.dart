import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/request/member_page_request/asset_info_list_request.dart';
import '../../../domain/response/flow_page_response/asset_info_list_response.dart';
import '../repository/flow_repository_impl.dart';
import '../state/flow_state.dart';

const int limit = 20;

final flowProvider = StateNotifierProvider.autoDispose<FlowNotifier, FlowState>((ref) {
  return FlowNotifier(ref);
});

class FlowNotifier extends StateNotifier<FlowState> {
  FlowNotifier(this.ref) : super(const FlowState()) {
    initDropdown();
  }

  final Ref ref;

  void initDropdown() {
    state = state.copyWith(fundsTransferSelectLabel: state.fundsTransferList.first);
    getFlowList(AssetInfoListRequest(page: state.currPage, limit: limit, type: state.fundsTransferSelectLabel!.label.type));
  }

  void updateDropdown(FundsTransferLabel fundsTransferSelectLabel) {
    state = state.copyWith(fundsTransferSelectLabel: fundsTransferSelectLabel,currPage: 1);
    getFlowList(AssetInfoListRequest(page: state.currPage, limit: limit, type: state.fundsTransferSelectLabel!.label.type));
  }

  Future<void> getFlowList(AssetInfoListRequest assetInfoListRequest) async {
    state = state.copyWith(status: FlowPageStatus.initial);
    final repository = ref.read(flowRepositoryProvider);
    AssetInfoListResponse response = await repository.getFlowList(assetInfoListRequest);
    state = state.copyWith(total: response.data?.total, assetInfo: response.data?.records,status: FlowPageStatus.success);
  }

  Future<void> updateFlowList(AssetInfoListRequest assetInfoListRequest) async {
    int currPage = state.currPage;
    final repository = ref.read(flowRepositoryProvider);
    AssetInfoListResponse response = await repository.getFlowList(assetInfoListRequest);
    state = state.copyWith(currPage: currPage + 1, assetInfo: List.of(state.assetInfo as Iterable<AssetInfo>)..addAll(response.data!.records));
  }

}
