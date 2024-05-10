import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/save_coin_response/save_coin_rate_response.dart';
import 'package:infinite_scroll/pages/invested/repository/invested_repository_impl.dart';
import '../../../domain/request/save_coin_request/send_save_coin_request.dart';
import '../state/invested_state.dart';

final investedProvider = StateNotifierProvider.autoDispose<InvestedNotifier, InvestedState>((ref) {
  return InvestedNotifier(ref);
});

class InvestedNotifier extends StateNotifier<InvestedState> {
  InvestedNotifier(this.ref) : super(const InvestedState()) {
    getRate();
  }

  final Ref ref;

  Future<void> getRate() async {
    final repository = ref.read(investedRepositoryProvider);
    SaveCoinRateResponse response = await repository.getRate();
    if (response.code == 0) {
      int usdtSelectedIndex = response.data?.USDT?.indexWhere((element) => element.isDefault == true) ?? 0;
      int filSelectedIndex = response.data?.FIL?.indexWhere((element) => element.isDefault == true) ?? 0;
      state = state.copyWith(
        saveCoinRateResponse: response,
        status: InvestedPageStatus.success,
        usdtItemSelectedIndex: usdtSelectedIndex,
        filItemSelectedIndex: filSelectedIndex,
      );
    }
  }

  void updateUsdtSelectedIndex(int value) {
    state = state.copyWith(
      usdtItemSelectedIndex: value,
    );
  }

  void updateFilSelectedIndex(int value) {
    state = state.copyWith(
      filItemSelectedIndex: value,
    );
  }

  Future<void> saveCoin(SendSaveCoinRequest request,{required Function completedFunc}) async {
    final repository = ref.read(investedRepositoryProvider);
    await repository.sendSaveCoin(request);
    completedFunc();
  }
}
