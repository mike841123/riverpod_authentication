// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceOrderResponse _$InsuranceOrderResponseFromJson(
        Map<String, dynamic> json) =>
    InsuranceOrderResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: json['data'] == null
          ? null
          : InsuranceOrderResult.fromJson(json['data'] as Map<String, dynamic>),
      extend: json['extend'],
    );

Map<String, dynamic> _$InsuranceOrderResponseToJson(
        InsuranceOrderResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

InsuranceOrderResult _$InsuranceOrderResultFromJson(
        Map<String, dynamic> json) =>
    InsuranceOrderResult(
      fypBalance: (json['fypBalance'] as num?)?.toDouble() ?? 0,
      exchangeAmount: (json['exchangeAmount'] as num?)?.toDouble() ?? 0,
      insuranceOrderInfoPage: json['insuranceOrderInfoPage'] == null
          ? null
          : InsuranceOrderInfoPage.fromJson(
              json['insuranceOrderInfoPage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InsuranceOrderResultToJson(
        InsuranceOrderResult instance) =>
    <String, dynamic>{
      'fypBalance': instance.fypBalance,
      'exchangeAmount': instance.exchangeAmount,
      'insuranceOrderInfoPage': instance.insuranceOrderInfoPage,
    };

InsuranceOrderInfoPage _$InsuranceOrderInfoPageFromJson(
        Map<String, dynamic> json) =>
    InsuranceOrderInfoPage(
      current: (json['current'] as num?)?.toInt() ?? 1,
      total: (json['total'] as num?)?.toInt() ?? 0,
      pages: (json['pages'] as num?)?.toInt() ?? 1,
      size: (json['size'] as num?)?.toInt() ?? 10,
      records: (json['records'] as List<dynamic>?)
              ?.map((e) => InfoPageItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      searchCount: json['searchCount'] as bool? ?? false,
    );

Map<String, dynamic> _$InsuranceOrderInfoPageToJson(
        InsuranceOrderInfoPage instance) =>
    <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
      'pages': instance.pages,
      'size': instance.size,
      'records': instance.records,
      'searchCount': instance.searchCount,
    };

InfoPageItem _$InfoPageItemFromJson(Map<String, dynamic> json) => InfoPageItem(
      id: (json['id'] as num).toInt(),
      insuranceTypeName: json['insuranceTypeName'] as String,
      amount: (json['amount'] as num).toInt(),
      exchangeAmount: (json['exchangeAmount'] as num).toDouble(),
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      auditStatus: (json['auditStatus'] as num).toInt(),
      insuranceCategoryId: (json['insuranceCategoryId'] as num).toInt(),
      insuranceCategoryName: json['insuranceCategoryName'] as String,
    );

Map<String, dynamic> _$InfoPageItemToJson(InfoPageItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'insuranceTypeName': instance.insuranceTypeName,
      'amount': instance.amount,
      'exchangeAmount': instance.exchangeAmount,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'auditStatus': instance.auditStatus,
      'insuranceCategoryId': instance.insuranceCategoryId,
      'insuranceCategoryName': instance.insuranceCategoryName,
    };
