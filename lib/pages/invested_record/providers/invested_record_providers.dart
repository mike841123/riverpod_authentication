import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:infinite_scroll/domain/response/public_response/normal_response.dart';
import 'package:infinite_scroll/pages/invested_record/repository/invested_record_repository_impl.dart';
import '../../../domain/request/save_coin_request/save_coin_history_request.dart';
import '../../../domain/response/save_coin_response/save_coin_history_response.dart';
import '../state/invested_record_state.dart';

final investedRecordProvider = StateNotifierProvider.autoDispose<InvestedRecordNotifier, InvestedRecordState>((ref) {
  return InvestedRecordNotifier(ref);
});

class InvestedRecordNotifier extends StateNotifier<InvestedRecordState> {
  InvestedRecordNotifier(this.ref) : super(const InvestedRecordState()) {
    getInvestedRecord();
  }

  final Ref ref;

  void updateCoinTypeSelected(InvestedCoinTypeLabel selectedLabel) {
    state = state.copyWith(coinTypeSelectedLabel: selectedLabel);
  }

  void updateOrderTypeSelected(InvestedOrderTypeLabel selectedLabel) {
    state = state.copyWith(orderTypeSelectedLabel: selectedLabel);
  }

  void clear() {
    state = state.copyWith(
      isClearSearch: true,
    );
  }

  Future<void> getInvestedRecord() async {
    try {
      if (state.status == InvestedRecordPageStatus.initial) {
        final post = await _fetchPosts();
        state = state.copyWith(investedRecordList: post, status: InvestedRecordPageStatus.success, currPage: 2, isLoadMore: true);
        return;
      }
      final post = await _fetchPosts(page: state.currPage);
      if (post.isNotEmpty) {
        state = state.copyWith(
          isLoadMore: false,
          currPage: state.currPage + 1,
          investedRecordList: List.of(state.investedRecordList)..addAll(post),
        );
      }
    } catch (_) {
      state = state.copyWith(status: InvestedRecordPageStatus.failure);
    }
  }

  Future<List<SaveCoinHistory>> _fetchPosts({int page = 1}) async {
    print("取得第${page}頁的資料");
    final repository = ref.read(investedRecordRepositoryProvider);
    SaveCoinHistoryResponse response = await repository.getInvestedRecord(SaveCoinHistoryRequest(
      page: page,
      limit: 10,
      assetType: state.coinTypeSelectedLabel == null ? "" : "&assetType=${state.coinTypeSelectedLabel?.label.type}",
      optionType: state.orderTypeSelectedLabel == null ? "" : "&optionType=${state.coinTypeSelectedLabel?.label.type}",
      startTime: (state.startDate ?? TextEditingController()).text.isEmpty ? "" : "&startTime=${state.startDate}",
      endTime: (state.endDate ?? TextEditingController()).text.isEmpty ? "" : "&endTime=${state.endDate}",
    ));
    if (response.code == 0) {
      return response.data?.records ?? [];
    } else {
      return [];
    }
  }

  /// 自動續存
  Future<NormalResponse> updateAutoSubscribe(int id, int autoSubscribe) async {
    final repository = ref.read(investedRecordRepositoryProvider);
    NormalResponse response = await repository.updateAutoSubscribe(id, autoSubscribe);
    SmartDialog.showToast(response.msg);
    return response;
  }

  /// 取得欲刷新的item
  Future<SaveCoinHistory> getItemAtIndex({required int index}) async {
    print("搜尋index為:$index的item");
    int indexInPage = index - (index ~/ 10) * 10;
    print("回傳十筆中的第幾筆資料:$indexInPage");
    final post = await _fetchPosts(page: index ~/ 10 + 1);
    return post[index < 10 ? index : indexInPage];
  }
}
