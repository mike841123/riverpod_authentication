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
    getInvestedRecord(1);
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

  Future<void> getInvestedRecord(int page, {bool isInit = true}) async {
    if (isInit) {
      state = state.copyWith(status: InvestedRecordPageStatus.initial);
    }
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
      for (int i = 0; i < (response.data?.records ?? []).length; i++) {
        response.data?.records[i].currentPage = response.data?.current;
      }
      state = state.copyWith(total: response.data?.total, investedRecordList: response.data?.records, status: InvestedRecordPageStatus.success);
    } else {
      state = state.copyWith(status: InvestedRecordPageStatus.failure);
    }
  }

  Future<void> updateInvestedRecord() async {
    int currPage = state.currPage;
    final repository = ref.read(investedRecordRepositoryProvider);
    state = state.copyWith(isLock: true);
    SaveCoinHistoryResponse response = await repository.getInvestedRecord(SaveCoinHistoryRequest(
      page: currPage + 1,
      limit: 10,
      assetType: state.coinTypeSelectedLabel == null ? "" : "&assetType=${state.coinTypeSelectedLabel?.label.type}",
      optionType: state.orderTypeSelectedLabel == null ? "" : "&optionType=${state.coinTypeSelectedLabel?.label.type}",
      startTime: (state.startDate ?? TextEditingController()).text.isEmpty ? "" : "&startTime=${state.startDate}",
      endTime: (state.endDate ?? TextEditingController()).text.isEmpty ? "" : "&endTime=${state.endDate}",
    ));
    if (response.data!.records.isNotEmpty) {
      for (int i = 0; i < (response.data?.records ?? []).length; i++) {
        response.data?.records[i].currentPage = response.data?.current;
      }
      state = state.copyWith(
          currPage: currPage + 1,
          investedRecordList: List.of(state.investedRecordList as Iterable<SaveCoinHistory>)..addAll(response.data!.records),
          isLock: false);
    }
  }

  Future<void> updateAutoSubscribe(int id, int autoSubscribe, int page) async {
    final repository = ref.read(investedRecordRepositoryProvider);
    NormalResponse response = await repository.updateAutoSubscribe(id, autoSubscribe);
    if (response.code == 0) {
      SmartDialog.dismiss();
    }
  }
}
