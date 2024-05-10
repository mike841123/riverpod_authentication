// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_coin_interest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveCoinInterestResponse _$SaveCoinInterestResponseFromJson(
        Map<String, dynamic> json) =>
    SaveCoinInterestResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: json['data'] == null
          ? null
          : SaveCoinInterestResult.fromJson(
              json['data'] as Map<String, dynamic>),
      extend: json['extend'],
    );

Map<String, dynamic> _$SaveCoinInterestResponseToJson(
        SaveCoinInterestResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

SaveCoinInterestResult _$SaveCoinInterestResultFromJson(
        Map<String, dynamic> json) =>
    SaveCoinInterestResult(
      current: (json['current'] as num?)?.toInt() ?? 1,
      total: (json['total'] as num?)?.toInt() ?? 0,
      pages: (json['pages'] as num?)?.toInt() ?? 1,
      size: (json['size'] as num?)?.toInt() ?? 10,
      records: (json['records'] as List<dynamic>?)
              ?.map((e) => SaveCoinInterest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      searchCount: json['searchCount'] as bool? ?? false,
    );

Map<String, dynamic> _$SaveCoinInterestResultToJson(
        SaveCoinInterestResult instance) =>
    <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
      'pages': instance.pages,
      'size': instance.size,
      'records': instance.records,
      'searchCount': instance.searchCount,
    };

SaveCoinInterest _$SaveCoinInterestFromJson(Map<String, dynamic> json) =>
    SaveCoinInterest(
      orderId: json['orderId'] as String? ?? "",
      payInterestDate: json['payInterestDate'] as String? ?? "",
      interestAmount: json['interestAmount'] as String? ?? "",
      createTime: json['createTime'] as String? ?? "",
      assetType: (json['assetType'] as num?)?.toInt() ?? 0,
      interestAssetName: json['interestAssetName'] as String? ?? "",
      optionType: (json['optionType'] as num?)?.toInt() ?? 0,
      startDate: json['startDate'] as String? ?? "",
      endDate: json['endDate'] as String? ?? "",
    );

Map<String, dynamic> _$SaveCoinInterestToJson(SaveCoinInterest instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'payInterestDate': instance.payInterestDate,
      'interestAmount': instance.interestAmount,
      'createTime': instance.createTime,
      'assetType': instance.assetType,
      'interestAssetName': instance.interestAssetName,
      'optionType': instance.optionType,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
