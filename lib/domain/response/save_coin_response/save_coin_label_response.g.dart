// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_coin_label_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveCoinLabelResponse _$SaveCoinLabelResponseFromJson(
        Map<String, dynamic> json) =>
    SaveCoinLabelResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SaveCoinLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
      extend: json['extend'],
    );

Map<String, dynamic> _$SaveCoinLabelResponseToJson(
        SaveCoinLabelResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

SaveCoinLabel _$SaveCoinLabelFromJson(Map<String, dynamic> json) =>
    SaveCoinLabel(
      coinId: json['coinId'] as String? ?? "",
      coinName: json['coinName'] as String? ?? "",
    );

Map<String, dynamic> _$SaveCoinLabelToJson(SaveCoinLabel instance) =>
    <String, dynamic>{
      'coinId': instance.coinId,
      'coinName': instance.coinName,
    };
