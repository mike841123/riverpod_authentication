import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/flow_page_response/asset_info_list_response.dart';
import 'package:infinite_scroll/get_it_service_locator.dart';
import '../../../domain/request/member_page_request/asset_info_list_request.dart';
import '../../../service/api_service.dart';
import 'flow_repository.dart';

class FlowRepositoryImpl extends FlowRepository {
  @override
  Future<AssetInfoListResponse> getFlowList(AssetInfoListRequest request) async {
    try {
      AssetInfoListResponse response = await getIt<ApiService>().getAssetCashList(request);
      return response;
    } catch (e) {
      print("12121122");
      print(e);

      throw Exception();
    }
  }
}

final flowRepositoryProvider = Provider<FlowRepository>((ref) {
  return FlowRepositoryImpl();
});
