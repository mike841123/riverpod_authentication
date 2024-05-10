import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/save_coin_response/save_coin_rate_response.dart';
import 'package:infinite_scroll/get_it_service_locator.dart';
import '../../../domain/request/save_coin_request/send_save_coin_request.dart';
import '../../../service/api_service.dart';
import 'invested_repository.dart';

class InvestedRepositoryImpl extends InvestedRepository {
  @override
  Future<SaveCoinRateResponse> getRate() async {
    try {
      SaveCoinRateResponse response = await getIt<ApiService>().getSaveCoinRate();
      return response;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> sendSaveCoin(SendSaveCoinRequest request) async {
    try {
      await getIt<ApiService>().sendSaveCoin(request);
    } catch (e) {
      throw Exception();
    }
  }
}

final investedRepositoryProvider = Provider<InvestedRepository>((ref) {
  return InvestedRepositoryImpl();
});
