import '../../../domain/response/home_page_response/banner_list_response.dart';

abstract class HomeRepository {
  //第一次取得資料
  Future<List<BannerItem>> getBannerList();
}
