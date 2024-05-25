import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/insurance_page_response/insurance_order_response.dart';

import '../../../get_it_service_locator.dart';
import '../../../service/api_service.dart';
import 'insurance_management_repository.dart';

class InsuranceManagementImpl extends InsuranceManagementRepository {
  @override
  Future<InsuranceOrderResponse> getInsuranceOrder({required String username, required int limit, required int page}) async {
    try {
      InsuranceOrderResponse response = await getIt<ApiService>().getAllInsuranceOrder(username: username, limit: limit, page: page);
      return response;
    } catch (e) {
      throw Exception();
    }
  }
}

final insuranceManagementRepositoryProvider = Provider<InsuranceManagementRepository>((ref) {
  return InsuranceManagementImpl();
});
