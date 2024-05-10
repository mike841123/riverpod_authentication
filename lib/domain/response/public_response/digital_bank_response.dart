import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';

part 'digital_bank_response.g.dart';

@JsonSerializable()
class DigitalBankResponse extends ApiResponse<DigitalBankResult> {
  DigitalBankResponse({super.msg, super.code, super.data, super.extend});

  factory DigitalBankResponse.fromJson(Map<String, dynamic> json) => _$DigitalBankResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DigitalBankResponseToJson(this);
}

@JsonSerializable()
class DigitalBankResult {
  DigitalBankResult({
    this.cashInfo,
    this.mt4Info,
    this.chainInfo = const [],
  });

  CashInfo? cashInfo;
  MT4Info? mt4Info;
  List<ChainInfo> chainInfo;

  factory DigitalBankResult.fromJson(Map<String, dynamic> json) => _$DigitalBankResultFromJson(json);

  Map<String, dynamic> toJson() => _$DigitalBankResultToJson(this);
}

@JsonSerializable()
class CashInfo {
  CashInfo({
    this.balance = 0.0,
    this.insureBalance = 0.0,
    this.tradeBalance = 0.0,
    this.profitBalance = 0.0,
    this.agentBalance = 0.0,
    this.recommendBalance = 0.0,
    this.levelBalance = 0.0,
    this.paidianBalance = 0.0,
    this.rpBalance = 0.0,
    this.agentWeightAwardBalance = 0.0,
    this.sensibleBalance = 0.0,
    this.serviceBalance = 0.0,
    this.shareRepurchaseBalance = 0.0,
    this.freeBalance = 0.0,
    this.totalUsd = 0.0,
    this.slBalance = 0.0,
    this.areaRecommendBalance = 0.0,
    this.ncsBalance = 0.0,
    this.ncsPurchaseBalance = 0.0,
    this.paperNo3Balance = 0.0,
    this.atBalance = 0.0,
    this.ucBalance = 0.0,
    this.arpBalance = 0.0,
  });

  double balance;
  double insureBalance;
  double tradeBalance;
  double profitBalance;
  double agentBalance;
  double recommendBalance;
  double levelBalance;
  double paidianBalance;
  double rpBalance;
  double agentWeightAwardBalance;
  double sensibleBalance;
  double serviceBalance;
  double shareRepurchaseBalance;
  double freeBalance;
  double totalUsd;
  double slBalance;
  double areaRecommendBalance;
  double ncsBalance;
  double ncsPurchaseBalance;
  double paperNo3Balance;
  double atBalance;
  double ucBalance;
  double arpBalance;

  factory CashInfo.fromJson(Map<String, dynamic> json) => _$CashInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CashInfoToJson(this);
}

@JsonSerializable()
class MT4Info {
  MT4Info({
    this.id = 0,
    this.mt4Account = "",
    this.credit = 0.0,
    this.equity = 0.0,
    this.margin = 0.0,
    this.marginfree = 0.0,
    this.mt4Balance = 0.0,
    this.mt4apk  = "",
    this.mt4apa  = "",
  });

  int id;
  String mt4Account;
  double credit;
  double equity;
  double margin;
  double marginfree;
  double mt4Balance;
  String mt4apk;
  String mt4apa;

  factory MT4Info.fromJson(Map<String, dynamic> json) => _$MT4InfoFromJson(json);

  Map<String, dynamic> toJson() => _$MT4InfoToJson(this);
}

@JsonSerializable()
class ChainInfo {
  ChainInfo({
    this.assetTypeId = 0,
    this.assetRate = 0.0,
    this.worth = 0.0,
    this.balance = 0.0,
    this.balanceFrozen = 0.0,
    this.assetName = "",
    this.icon = "",
  });

  int assetTypeId;
  double assetRate;
  double worth;
  double balance;
  double balanceFrozen;
  String assetName;
  String icon;

  factory ChainInfo.fromJson(Map<String, dynamic> json) => _$ChainInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ChainInfoToJson(this);
}