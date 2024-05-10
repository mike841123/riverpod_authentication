// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_coin_rate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveCoinRateResponse _$SaveCoinRateResponseFromJson(
        Map<String, dynamic> json) =>
    SaveCoinRateResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: json['data'] == null
          ? null
          : SaveCoinRateResult.fromJson(json['data'] as Map<String, dynamic>),
      extend: json['extend'],
    );

Map<String, dynamic> _$SaveCoinRateResponseToJson(
        SaveCoinRateResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

SaveCoinRateResult _$SaveCoinRateResultFromJson(Map<String, dynamic> json) =>
    SaveCoinRateResult(
      USDT: (json['USDT'] as List<dynamic>?)
          ?.map((e) => RateInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      FIL: (json['FIL'] as List<dynamic>?)
          ?.map((e) => RateInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaveCoinRateResultToJson(SaveCoinRateResult instance) =>
    <String, dynamic>{
      'USDT': instance.USDT,
      'FIL': instance.FIL,
    };

RateInfo _$RateInfoFromJson(Map<String, dynamic> json) => RateInfo(
      id: (json['id'] as num?)?.toInt() ?? 0,
      type: (json['type'] as num?)?.toInt() ?? 0,
      legalDays: (json['legalDays'] as num?)?.toInt() ?? 0,
      dailyRate: (json['dailyRate'] as num?)?.toDouble() ?? 0.0,
      annualRate: (json['annualRate'] as num?)?.toDouble() ?? 0.0,
      minAmount: (json['minAmount'] as num?)?.toDouble() ?? 0.0,
      availableQuota: (json['availableQuota'] as num?)?.toDouble() ?? 0.0,
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$RateInfoToJson(RateInfo instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'legalDays': instance.legalDays,
      'dailyRate': instance.dailyRate,
      'annualRate': instance.annualRate,
      'minAmount': instance.minAmount,
      'availableQuota': instance.availableQuota,
      'isDefault': instance.isDefault,
    };
