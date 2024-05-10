import '../../../domain/request/save_coin_request/send_save_coin_request.dart';
import '../../../domain/response/save_coin_response/save_coin_rate_response.dart';

abstract class InvestedRepository {
  Future<SaveCoinRateResponse> getRate();
  Future<void> sendSaveCoin(SendSaveCoinRequest request);
}
