// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageResponse _$UploadImageResponseFromJson(Map<String, dynamic> json) =>
    UploadImageResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UploadImageResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      extend: json['extend'],
    );

Map<String, dynamic> _$UploadImageResponseToJson(
        UploadImageResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

UploadImageResult _$UploadImageResultFromJson(Map<String, dynamic> json) =>
    UploadImageResult(
      imgSrc: json['imgSrc'] as String? ?? "",
      imgUrl: json['imgUrl'] as String? ?? "",
    );

Map<String, dynamic> _$UploadImageResultToJson(UploadImageResult instance) =>
    <String, dynamic>{
      'imgSrc': instance.imgSrc,
      'imgUrl': instance.imgUrl,
    };
