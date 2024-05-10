import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';

part 'save_coin_rate_response.g.dart';

@JsonSerializable()
class SaveCoinRateResponse extends ApiResponse<SaveCoinRateResult> {
  SaveCoinRateResponse({String msg = "", int code = 1, SaveCoinRateResult? data, dynamic extend}) : super(msg: msg, code: code, data: data, extend: extend);

  factory SaveCoinRateResponse.fromJson(Map<String, dynamic> json) => _$SaveCoinRateResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SaveCoinRateResponseToJson(this);
}

@JsonSerializable()
class SaveCoinRateResult {
  SaveCoinRateResult({
    this.USDT,
    this.FIL,
  });

  List<RateInfo>? USDT;
  List<RateInfo>? FIL;

  factory SaveCoinRateResult.fromJson(Map<String, dynamic> json) => _$SaveCoinRateResultFromJson(json);

  Map<String, dynamic> toJson() => _$SaveCoinRateResultToJson(this);
}

@JsonSerializable()
class RateInfo {
  RateInfo({
    this.id = 0,
    this.type = 0,
    this.legalDays = 0,
    this.dailyRate = 0.0,
    this.annualRate = 0.0,
    this.minAmount = 0.0,
    this.availableQuota = 0.0,
    this.isDefault = false,
  });

  int id;
  int type;
  int legalDays;
  double dailyRate;
  double annualRate;
  double minAmount;
  double availableQuota;
  bool isDefault;


  factory RateInfo.fromJson(Map<String, dynamic> json) => _$RateInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RateInfoToJson(this);
}
