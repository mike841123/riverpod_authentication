import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/pages/insurance_management/repository/insurance_management_repository_impl.dart';
import 'package:infinite_scroll/pages/insurance_management/state/insurance_management_state.dart';
import '../../../domain/response/insurance_page_response/insurance_order_response.dart';

final insuranceManagementProvider = StateNotifierProvider.autoDispose<InsuranceManagementNotifier, InsuranceManagementState>((ref) {
  return InsuranceManagementNotifier(ref);
});

class InsuranceManagementNotifier extends StateNotifier<InsuranceManagementState> {
  InsuranceManagementNotifier(this.ref) : super(const InsuranceManagementState()) {
    getInsuranceOrder(isInit: true);
  }

  final Ref ref;

  Future<void> getInsuranceOrder({bool isInit = false}) async {
    try {
      if (state.status == InsuranceManagementPageStatus.initial || isInit) {
        state = state.copyWith(status: InsuranceManagementPageStatus.initial);
        final post = await _fetchPosts();
        state = state.copyWith(insuranceOrderList: post, status: InsuranceManagementPageStatus.success, currPage: 2, isLoadMore: true);
        return;
      }
      final post = await _fetchPosts(page: state.currPage);
      if (post.isNotEmpty) {
        state = state.copyWith(
          isLoadMore: false,
          currPage: state.currPage + 1,
          insuranceOrderList: List.of(state.insuranceOrderList)..addAll(post),
        );
      }
    } catch (_) {
      state = state.copyWith(status: InsuranceManagementPageStatus.failure);
    }
  }

  Future<List<InfoPageItem>> _fetchPosts({int page = 1}) async {
    print("取得第${page}頁的資料");
    final repository = ref.read(insuranceManagementRepositoryProvider);
    InsuranceOrderResponse response = await repository.getInsuranceOrder(username: "", limit: 10, page: page);
    if (response.code == 0) {
      return response.data?.insuranceOrderInfoPage?.records ?? [];
    } else {
      return [];
    }
  }
}
