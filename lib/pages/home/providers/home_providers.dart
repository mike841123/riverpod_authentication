import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/home_page_response/banner_list_response.dart';

import '../../../model/providers/user_providers.dart';
import '../repository/home_repository_impl.dart';
import '../state/home_state.dart';

final homeProvider = StateNotifierProvider<AllPostNotifier, HomeState>((ref) {
  return AllPostNotifier(ref);
});

class AllPostNotifier extends StateNotifier<HomeState> {
  AllPostNotifier(this.ref) : super(const HomeState()) {
    refresh();
  }

  final Ref ref;

  Future<void> refresh() async {
    final repository = ref.read(homeRepositoryProvider);
    List<BannerItem> bannerList = await repository.getBannerList();
    state = state.copyWith(bannerList: bannerList);
  }
}
