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

  Future<void> getInvestedRecord({int? page}) async {
    try {
      if (state.status == InvestedRecordPageStatus.initial) {
        final post = await _fetchPosts();
        state = state.copyWith(investedRecordList: post, status: InvestedRecordPageStatus.success, currPage: 2, isLoadMore: true);
        return;
      }
      final post = await _fetchPosts(page: page);
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

  // Future<void> updateList({required int page}) async {
  //   final post = await _fetchPosts(page: page);
  //   if (post.isNotEmpty) {
  //     state = state.copyWith(
  //       investedRecordList: post,
  //     );
  //   }
  // }

  Future<List<SaveCoinHistory>> _fetchPosts({int? page}) async {
    print("第${state.currPage}頁");
    final repository = ref.read(investedRecordRepositoryProvider);
    SaveCoinHistoryResponse response = await repository.getInvestedRecord(SaveCoinHistoryRequest(
      page: page ?? state.currPage,
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

  Future<void> updateAutoSubscribe(int id, int autoSubscribe, int page) async {
    final repository = ref.read(investedRecordRepositoryProvider);
    NormalResponse response = await repository.updateAutoSubscribe(id, autoSubscribe);
    if (response.code == 0) {
      // updateList(page: page);
    }
  }
}
