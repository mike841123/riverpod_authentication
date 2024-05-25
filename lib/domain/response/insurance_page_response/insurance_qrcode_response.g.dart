// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_qrcode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceQrcodeResponse _$InsuranceQrcodeResponseFromJson(
        Map<String, dynamic> json) =>
    InsuranceQrcodeResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => InsuranceQrcodeResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      extend: json['extend'],
    );

Map<String, dynamic> _$InsuranceQrcodeResponseToJson(
        InsuranceQrcodeResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

InsuranceQrcodeResult _$InsuranceQrcodeResultFromJson(
        Map<String, dynamic> json) =>
    InsuranceQrcodeResult(
      imgUrl: json['imgUrl'] as String? ?? "",
      qrKind: json['qrKind'] as String? ?? "",
    );

Map<String, dynamic> _$InsuranceQrcodeResultToJson(
        InsuranceQrcodeResult instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'qrKind': instance.qrKind,
    };
