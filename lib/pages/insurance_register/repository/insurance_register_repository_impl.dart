import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/insurance_page_response/insurance_qrcode_response.dart';

import '../../../domain/response/insurance_page_response/insurance_info_response.dart';
import '../../../get_it_service_locator.dart';
import '../../../service/api_service.dart';
import 'insurance_register_repository.dart';

class InsuranceRegisterImpl extends InsuranceRegisterRepository {
  @override
  Future<InsuranceInfoResponse> getInsuranceInfo() async {
    try {
      InsuranceInfoResponse response = await getIt<ApiService>().getAllInsuranceInfo();
      return response;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<InsuranceQrcodeResponse> getCustomerQrCode(int countryId) async {
    try {
      InsuranceQrcodeResponse response = await getIt<ApiService>().getCustomerQrCode(countryId);
      return response;
    } catch (e) {
      throw Exception();
    }
  }
}

final insuranceRegisterRepositoryProvider = Provider<InsuranceRegisterRepository>((ref) {
  return InsuranceRegisterImpl();
});
