import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/public_response/normal_response.dart';
import 'package:infinite_scroll/domain/response/save_coin_response/save_coin_history_response.dart';
import 'package:infinite_scroll/get_it_service_locator.dart';
import '../../../domain/request/save_coin_request/save_coin_history_request.dart';
import '../../../service/api_service.dart';
import 'invested_record_repository.dart';

class InvestedRecordRepositoryImpl extends InvestedRecordRepository {
  @override
  Future<SaveCoinHistoryResponse> getInvestedRecord(SaveCoinHistoryRequest request) async {
    try {
      SaveCoinHistoryResponse response = await getIt<ApiService>().getSaveCoinHistory(request);
      return response;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<NormalResponse> updateAutoSubscribe(int id, int autoSubscribe) async {
    try {
      NormalResponse response = await getIt<ApiService>().updateAutoSubscribe(id, autoSubscribe);
      return response;
    } catch (e) {
      throw Exception();
    }
  }
}

final investedRecordRepositoryProvider = Provider<InvestedRecordRepository>((ref) {
  return InvestedRecordRepositoryImpl();
});
