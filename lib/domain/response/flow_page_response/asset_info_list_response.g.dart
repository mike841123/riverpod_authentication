// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_info_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetInfoListResponse _$AssetInfoListResponseFromJson(
        Map<String, dynamic> json) =>
    AssetInfoListResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: json['data'] == null
          ? null
          : AssetInfoListResult.fromJson(json['data'] as Map<String, dynamic>),
      extend: json['extend'],
    );

Map<String, dynamic> _$AssetInfoListResponseToJson(
        AssetInfoListResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

AssetInfoListResult _$AssetInfoListResultFromJson(Map<String, dynamic> json) =>
    AssetInfoListResult(
      current: (json['current'] as num?)?.toInt() ?? 1,
      total: (json['total'] as num?)?.toInt() ?? 0,
      pages: (json['pages'] as num?)?.toInt() ?? 1,
      size: (json['size'] as num?)?.toInt() ?? 10,
      records: (json['records'] as List<dynamic>?)
              ?.map((e) => AssetInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      searchCount: json['searchCount'] as bool? ?? false,
    );

Map<String, dynamic> _$AssetInfoListResultToJson(
        AssetInfoListResult instance) =>
    <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
      'pages': instance.pages,
      'size': instance.size,
      'records': instance.records,
      'searchCount': instance.searchCount,
    };

AssetInfo _$AssetInfoFromJson(Map<String, dynamic> json) => AssetInfo(
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      remark: json['remark'] as String? ?? "",
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? "",
      createDate: json['createDate'] as String? ?? "",
      status: json['status'] as String? ?? "",
    );

Map<String, dynamic> _$AssetInfoToJson(AssetInfo instance) => <String, dynamic>{
      'price': instance.price,
      'remark': instance.remark,
      'id': instance.id,
      'title': instance.title,
      'createDate': instance.createDate,
      'status': instance.status,
    };
