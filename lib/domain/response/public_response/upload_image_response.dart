import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';

part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse extends ApiResponse<List<UploadImageResult>> {
  UploadImageResponse({super.msg = "", super.code = 1, super.data, super.extend});

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) => _$UploadImageResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UploadImageResponseToJson(this);
} 

@JsonSerializable()
class UploadImageResult {
  UploadImageResult({
    this.imgSrc = "",
    this.imgUrl = "",
  });

  String imgSrc;
  String imgUrl;

  factory UploadImageResult.fromJson(Map<String, dynamic> json) => _$UploadImageResultFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResultToJson(this);
}
