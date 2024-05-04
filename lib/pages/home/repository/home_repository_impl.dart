import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/home_page_response/banner_list_response.dart';
import 'package:infinite_scroll/get_it_service_locator.dart';
import '../../../service/api_service.dart';
import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<List<BannerItem>> getBannerList() async {
    BannerListResponse response = await getIt<ApiService>().getBannerList();
    return response.data ?? [];
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});
