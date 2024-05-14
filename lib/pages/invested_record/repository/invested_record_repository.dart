import '../../../domain/request/save_coin_request/save_coin_history_request.dart';
import '../../../domain/response/public_response/normal_response.dart';
import '../../../domain/response/save_coin_response/save_coin_history_response.dart';

abstract class InvestedRecordRepository {
  Future<SaveCoinHistoryResponse> getInvestedRecord(SaveCoinHistoryRequest request);
  Future<NormalResponse> updateAutoSubscribe(int id,int autoSubscribe);
}
