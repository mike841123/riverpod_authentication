
import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';
import '../list_result.dart';

part 'save_coin_interest_response.g.dart';

@JsonSerializable()
class SaveCoinInterestResponse extends ApiResponse<SaveCoinInterestResult> {
  SaveCoinInterestResponse({super.msg, super.code, super.data, super.extend});

  factory SaveCoinInterestResponse.fromJson(Map<String, dynamic> json) => _$SaveCoinInterestResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SaveCoinInterestResponseToJson(this);
}

@JsonSerializable()
class SaveCoinInterestResult extends ListResult<SaveCoinInterest> {
  SaveCoinInterestResult({super.current, super.total, super.pages, super.size, super.records = const [], super.searchCount});

  factory SaveCoinInterestResult.fromJson(Map<String, dynamic> json) => _$SaveCoinInterestResultFromJson(json);

  Map<String, dynamic> toJson() => _$SaveCoinInterestResultToJson(this);
}

@JsonSerializable()
class SaveCoinInterest {
  SaveCoinInterest({
    this.orderId = "",
    this.payInterestDate = "",
    this.interestAmount = "",
    this.createTime = "",
    this.assetType = 0,
    this.interestAssetName = "",
    this.optionType = 0,
    this.startDate = "",
    this.endDate = "",
  });

  String orderId;
  String payInterestDate;
  String interestAmount;
  String createTime;
  int assetType;
  String interestAssetName;
  int optionType;
  String startDate;
  String endDate;

  factory SaveCoinInterest.fromJson(Map<String, dynamic> json) => _$SaveCoinInterestFromJson(json);

  Map<String, dynamic> toJson() => _$SaveCoinInterestToJson(this);
}
