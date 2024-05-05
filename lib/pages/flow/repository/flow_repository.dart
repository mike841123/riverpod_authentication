import '../../../domain/request/member_page_request/asset_info_list_request.dart';
import '../../../domain/response/flow_page_response/asset_info_list_response.dart';

abstract class FlowRepository {
  Future<AssetInfoListResponse> getFlowList(AssetInfoListRequest request);
}
