// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceInfoResponse _$InsuranceInfoResponseFromJson(
        Map<String, dynamic> json) =>
    InsuranceInfoResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InsuranceInfoResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      extend: json['extend'],
    );

Map<String, dynamic> _$InsuranceInfoResponseToJson(
        InsuranceInfoResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

InsuranceInfoResult _$InsuranceInfoResultFromJson(Map<String, dynamic> json) =>
    InsuranceInfoResult(
      id: (json['id'] as num?)?.toInt() ?? 0,
      countryId: (json['countryId'] as num?)?.toInt() ?? 0,
      countryName: json['countryName'] as String? ?? "",
      areaId: (json['areaId'] as num?)?.toInt() ?? 0,
      areaName: json['areaName'] as String? ?? "",
      insuranceCompanyId: (json['insuranceCompanyId'] as num?)?.toInt() ?? 0,
      insuranceCompanyName: json['insuranceCompanyName'] as String? ?? "",
      insuranceTypeName: json['insuranceTypeName'] as String? ?? "",
      commissionRate: (json['commissionRate'] as num?)?.toDouble() ?? 0.0,
      insuranceCategoryId: (json['insuranceCategoryId'] as num?)?.toInt() ?? 0,
      insuranceCategoryName: json['insuranceCategoryName'] as String? ?? "",
    );

Map<String, dynamic> _$InsuranceInfoResultToJson(
        InsuranceInfoResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
      'areaId': instance.areaId,
      'areaName': instance.areaName,
      'insuranceCompanyId': instance.insuranceCompanyId,
      'insuranceCompanyName': instance.insuranceCompanyName,
      'insuranceTypeName': instance.insuranceTypeName,
      'commissionRate': instance.commissionRate,
      'insuranceCategoryId': instance.insuranceCategoryId,
      'insuranceCategoryName': instance.insuranceCategoryName,
    };
