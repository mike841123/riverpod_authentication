import 'package:infinite_scroll/domain/response/insurance_page_response/insurance_order_response.dart';

abstract class InsuranceManagementRepository {
  Future<InsuranceOrderResponse> getInsuranceOrder({required String username, required int limit, required int page});
}
