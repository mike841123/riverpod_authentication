// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_coin_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveCoinHistoryResponse _$SaveCoinHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    SaveCoinHistoryResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: json['data'] == null
          ? null
          : SaveCoinHistoryResult.fromJson(
              json['data'] as Map<String, dynamic>),
      extend: json['extend'],
    );

Map<String, dynamic> _$SaveCoinHistoryResponseToJson(
        SaveCoinHistoryResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

SaveCoinHistoryResult _$SaveCoinHistoryResultFromJson(
        Map<String, dynamic> json) =>
    SaveCoinHistoryResult(
      current: (json['current'] as num?)?.toInt() ?? 1,
      total: (json['total'] as num?)?.toInt() ?? 0,
      pages: (json['pages'] as num?)?.toInt() ?? 1,
      size: (json['size'] as num?)?.toInt() ?? 10,
      records: (json['records'] as List<dynamic>?)
              ?.map((e) => SaveCoinHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      searchCount: json['searchCount'] as bool? ?? false,
    );

Map<String, dynamic> _$SaveCoinHistoryResultToJson(
        SaveCoinHistoryResult instance) =>
    <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
      'pages': instance.pages,
      'size': instance.size,
      'records': instance.records,
      'searchCount': instance.searchCount,
    };

SaveCoinHistory _$SaveCoinHistoryFromJson(Map<String, dynamic> json) =>
    SaveCoinHistory(
      id: (json['id'] as num?)?.toInt() ?? 0,
      orderId: json['orderId'] as String? ?? "",
      assetType: (json['assetType'] as num?)?.toInt() ?? 0,
      investedAmount: (json['investedAmount'] as num?)?.toDouble() ?? 0.0,
      annualRate: (json['annualRate'] as num?)?.toDouble() ?? 0.0,
      dailyRate: (json['dailyRate'] as num?)?.toDouble() ?? 0.0,
      totalInterestAmount:
          (json['totalInterestAmount'] as num?)?.toDouble() ?? 0.0,
      optionType: (json['optionType'] as num?)?.toInt() ?? 0,
      legalDays: (json['legalDays'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      autoSubscribe: (json['autoSubscribe'] as num?)?.toInt() ?? 0,
      startDate: json['startDate'] as String? ?? "",
      endDate: json['endDate'] as String? ?? "",
      redeemDate: json['redeemDate'] as String? ?? "",
      payInterestDate: json['payInterestDate'] as String? ?? "",
      createTime: json['createTime'] as String? ?? "",
    )..currentPage = (json['currentPage'] as num?)?.toInt() ?? 0;

Map<String, dynamic> _$SaveCoinHistoryToJson(SaveCoinHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'assetType': instance.assetType,
      'investedAmount': instance.investedAmount,
      'annualRate': instance.annualRate,
      'dailyRate': instance.dailyRate,
      'totalInterestAmount': instance.totalInterestAmount,
      'optionType': instance.optionType,
      'legalDays': instance.legalDays,
      'status': instance.status,
      'autoSubscribe': instance.autoSubscribe,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'redeemDate': instance.redeemDate,
      'payInterestDate': instance.payInterestDate,
      'createTime': instance.createTime,
      'currentPage': instance.currentPage,
    };
