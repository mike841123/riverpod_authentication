// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerListResponse _$BannerListResponseFromJson(Map<String, dynamic> json) =>
    BannerListResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BannerItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      extend: json['extend'],
    );

Map<String, dynamic> _$BannerListResponseToJson(BannerListResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

BannerItem _$BannerItemFromJson(Map<String, dynamic> json) => BannerItem(
      cnImage: json['cnImage'] as String? ?? "",
      linkUrl: json['linkUrl'] as String? ?? "",
      id: (json['id'] as num?)?.toInt(),
      position: (json['position'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$BannerItemToJson(BannerItem instance) =>
    <String, dynamic>{
      'cnImage': instance.cnImage,
      'linkUrl': instance.linkUrl,
      'id': instance.id,
      'position': instance.position,
    };
