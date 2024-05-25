// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRateResponse _$ExchangeRateResponseFromJson(
        Map<String, dynamic> json) =>
    ExchangeRateResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Rate.fromJson(e as Map<String, dynamic>))
          .toList(),
      extend: json['extend'],
    );

Map<String, dynamic> _$ExchangeRateResponseToJson(
        ExchangeRateResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

Rate _$RateFromJson(Map<String, dynamic> json) => Rate(
      countryId: (json['countryId'] as num).toInt(),
      currencyCode: json['currencyCode'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$RateToJson(Rate instance) => <String, dynamic>{
      'countryId': instance.countryId,
      'currencyCode': instance.currencyCode,
      'rate': instance.rate,
    };
