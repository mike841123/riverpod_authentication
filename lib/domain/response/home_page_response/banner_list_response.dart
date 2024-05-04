import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';

part 'banner_list_response.g.dart';

@JsonSerializable()
class BannerListResponse extends ApiResponse<List<BannerItem>> {
  BannerListResponse({super.msg, super.code, super.data, super.extend});

  factory BannerListResponse.fromJson(Map<String, dynamic> json) => _$BannerListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BannerListResponseToJson(this);
}

@JsonSerializable()
class BannerItem {
  BannerItem({
    this.cnImage = "",
    this.linkUrl = "",
    this.id,
    this.position = 1,
  });

  String cnImage;
  String linkUrl;
  int? id;
  int position;

  factory BannerItem.fromJson(Map<String, dynamic> json) => _$BannerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
}
