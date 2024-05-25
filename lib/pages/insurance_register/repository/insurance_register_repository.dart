import '../../../domain/response/insurance_page_response/insurance_info_response.dart';
import '../../../domain/response/insurance_page_response/insurance_qrcode_response.dart';

abstract class InsuranceRegisterRepository {
  Future<InsuranceInfoResponse> getInsuranceInfo();
  Future<InsuranceQrcodeResponse> getCustomerQrCode(int countryId);
}
