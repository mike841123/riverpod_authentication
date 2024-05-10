import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';
import '../list_result.dart';

part 'save_coin_history_response.g.dart';

@JsonSerializable()
class SaveCoinHistoryResponse extends ApiResponse<SaveCoinHistoryResult> {
  SaveCoinHistoryResponse({super.msg, super.code, super.data, super.extend});

  factory SaveCoinHistoryResponse.fromJson(Map<String, dynamic> json) => _$SaveCoinHistoryResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SaveCoinHistoryResponseToJson(this);
}

@JsonSerializable()
class SaveCoinHistoryResult extends ListResult<SaveCoinHistory> {
  SaveCoinHistoryResult({super.current, super.total, super.pages, super.size, super.records = const [], super.searchCount});

  factory SaveCoinHistoryResult.fromJson(Map<String, dynamic> json) => _$SaveCoinHistoryResultFromJson(json);

  Map<String, dynamic> toJson() => _$SaveCoinHistoryResultToJson(this);
}

@JsonSerializable()
class SaveCoinHistory {
  SaveCoinHistory({
    this.id = 0,
    this.orderId = "",
    this.assetType = 0,
    this.investedAmount = 0.0,
    this.annualRate = 0.0,
    this.dailyRate = 0.0,
    this.totalInterestAmount = 0.0,
    this.optionType = 0,
    this.legalDays = 0,
    this.status = 0,
    this.autoSubscribe = 0,
    this.startDate = "",
    this.endDate = "",
    this.redeemDate = "",
    this.payInterestDate = "",
    this.createTime = "",
  });

  int id;
  String orderId;
  int assetType;
  double investedAmount;
  double annualRate;
  double dailyRate;
  double totalInterestAmount;
  int optionType;
  int legalDays;
  int status;
  int autoSubscribe;
  String startDate;
  String endDate;
  String redeemDate;
  String payInterestDate;
  String createTime;

  factory SaveCoinHistory.fromJson(Map<String, dynamic> json) => _$SaveCoinHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$SaveCoinHistoryToJson(this);
}
