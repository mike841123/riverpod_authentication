// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_bank_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DigitalBankResponse _$DigitalBankResponseFromJson(Map<String, dynamic> json) =>
    DigitalBankResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: json['data'] == null
          ? null
          : DigitalBankResult.fromJson(json['data'] as Map<String, dynamic>),
      extend: json['extend'],
    );

Map<String, dynamic> _$DigitalBankResponseToJson(
        DigitalBankResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

DigitalBankResult _$DigitalBankResultFromJson(Map<String, dynamic> json) =>
    DigitalBankResult(
      cashInfo: json['cashInfo'] == null
          ? null
          : CashInfo.fromJson(json['cashInfo'] as Map<String, dynamic>),
      mt4Info: json['mt4Info'] == null
          ? null
          : MT4Info.fromJson(json['mt4Info'] as Map<String, dynamic>),
      chainInfo: (json['chainInfo'] as List<dynamic>?)
              ?.map((e) => ChainInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DigitalBankResultToJson(DigitalBankResult instance) =>
    <String, dynamic>{
      'cashInfo': instance.cashInfo,
      'mt4Info': instance.mt4Info,
      'chainInfo': instance.chainInfo,
    };

CashInfo _$CashInfoFromJson(Map<String, dynamic> json) => CashInfo(
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
      insureBalance: (json['insureBalance'] as num?)?.toDouble() ?? 0.0,
      tradeBalance: (json['tradeBalance'] as num?)?.toDouble() ?? 0.0,
      profitBalance: (json['profitBalance'] as num?)?.toDouble() ?? 0.0,
      agentBalance: (json['agentBalance'] as num?)?.toDouble() ?? 0.0,
      recommendBalance: (json['recommendBalance'] as num?)?.toDouble() ?? 0.0,
      levelBalance: (json['levelBalance'] as num?)?.toDouble() ?? 0.0,
      paidianBalance: (json['paidianBalance'] as num?)?.toDouble() ?? 0.0,
      rpBalance: (json['rpBalance'] as num?)?.toDouble() ?? 0.0,
      agentWeightAwardBalance:
          (json['agentWeightAwardBalance'] as num?)?.toDouble() ?? 0.0,
      sensibleBalance: (json['sensibleBalance'] as num?)?.toDouble() ?? 0.0,
      serviceBalance: (json['serviceBalance'] as num?)?.toDouble() ?? 0.0,
      shareRepurchaseBalance:
          (json['shareRepurchaseBalance'] as num?)?.toDouble() ?? 0.0,
      freeBalance: (json['freeBalance'] as num?)?.toDouble() ?? 0.0,
      totalUsd: (json['totalUsd'] as num?)?.toDouble() ?? 0.0,
      slBalance: (json['slBalance'] as num?)?.toDouble() ?? 0.0,
      areaRecommendBalance:
          (json['areaRecommendBalance'] as num?)?.toDouble() ?? 0.0,
      ncsBalance: (json['ncsBalance'] as num?)?.toDouble() ?? 0.0,
      ncsPurchaseBalance:
          (json['ncsPurchaseBalance'] as num?)?.toDouble() ?? 0.0,
      paperNo3Balance: (json['paperNo3Balance'] as num?)?.toDouble() ?? 0.0,
      atBalance: (json['atBalance'] as num?)?.toDouble() ?? 0.0,
      ucBalance: (json['ucBalance'] as num?)?.toDouble() ?? 0.0,
      arpBalance: (json['arpBalance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CashInfoToJson(CashInfo instance) => <String, dynamic>{
      'balance': instance.balance,
      'insureBalance': instance.insureBalance,
      'tradeBalance': instance.tradeBalance,
      'profitBalance': instance.profitBalance,
      'agentBalance': instance.agentBalance,
      'recommendBalance': instance.recommendBalance,
      'levelBalance': instance.levelBalance,
      'paidianBalance': instance.paidianBalance,
      'rpBalance': instance.rpBalance,
      'agentWeightAwardBalance': instance.agentWeightAwardBalance,
      'sensibleBalance': instance.sensibleBalance,
      'serviceBalance': instance.serviceBalance,
      'shareRepurchaseBalance': instance.shareRepurchaseBalance,
      'freeBalance': instance.freeBalance,
      'totalUsd': instance.totalUsd,
      'slBalance': instance.slBalance,
      'areaRecommendBalance': instance.areaRecommendBalance,
      'ncsBalance': instance.ncsBalance,
      'ncsPurchaseBalance': instance.ncsPurchaseBalance,
      'paperNo3Balance': instance.paperNo3Balance,
      'atBalance': instance.atBalance,
      'ucBalance': instance.ucBalance,
      'arpBalance': instance.arpBalance,
    };

MT4Info _$MT4InfoFromJson(Map<String, dynamic> json) => MT4Info(
      id: (json['id'] as num?)?.toInt() ?? 0,
      mt4Account: json['mt4Account'] as String? ?? "",
      credit: (json['credit'] as num?)?.toDouble() ?? 0.0,
      equity: (json['equity'] as num?)?.toDouble() ?? 0.0,
      margin: (json['margin'] as num?)?.toDouble() ?? 0.0,
      marginfree: (json['marginfree'] as num?)?.toDouble() ?? 0.0,
      mt4Balance: (json['mt4Balance'] as num?)?.toDouble() ?? 0.0,
      mt4apk: json['mt4apk'] as String? ?? "",
      mt4apa: json['mt4apa'] as String? ?? "",
    );

Map<String, dynamic> _$MT4InfoToJson(MT4Info instance) => <String, dynamic>{
      'id': instance.id,
      'mt4Account': instance.mt4Account,
      'credit': instance.credit,
      'equity': instance.equity,
      'margin': instance.margin,
      'marginfree': instance.marginfree,
      'mt4Balance': instance.mt4Balance,
      'mt4apk': instance.mt4apk,
      'mt4apa': instance.mt4apa,
    };

ChainInfo _$ChainInfoFromJson(Map<String, dynamic> json) => ChainInfo(
      assetTypeId: (json['assetTypeId'] as num?)?.toInt() ?? 0,
      assetRate: (json['assetRate'] as num?)?.toDouble() ?? 0.0,
      worth: (json['worth'] as num?)?.toDouble() ?? 0.0,
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
      balanceFrozen: (json['balanceFrozen'] as num?)?.toDouble() ?? 0.0,
      assetName: json['assetName'] as String? ?? "",
      icon: json['icon'] as String? ?? "",
    );

Map<String, dynamic> _$ChainInfoToJson(ChainInfo instance) => <String, dynamic>{
      'assetTypeId': instance.assetTypeId,
      'assetRate': instance.assetRate,
      'worth': instance.worth,
      'balance': instance.balance,
      'balanceFrozen': instance.balanceFrozen,
      'assetName': instance.assetName,
      'icon': instance.icon,
    };
