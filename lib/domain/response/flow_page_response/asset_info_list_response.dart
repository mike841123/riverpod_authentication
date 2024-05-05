import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';
import '../list_result.dart';

part 'asset_info_list_response.g.dart';

@JsonSerializable()
class AssetInfoListResponse extends ApiResponse<AssetInfoListResult> {
  AssetInfoListResponse({super.msg, super.code, super.data, super.extend});

  factory AssetInfoListResponse.fromJson(Map<String, dynamic> json) => _$AssetInfoListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AssetInfoListResponseToJson(this);
}

@JsonSerializable()
class AssetInfoListResult extends ListResult<AssetInfo> {
  AssetInfoListResult({super.current, super.total, super.pages, super.size, super.records = const [], super.searchCount});

  factory AssetInfoListResult.fromJson(Map<String, dynamic> json) => _$AssetInfoListResultFromJson(json);

  Map<String, dynamic> toJson() => _$AssetInfoListResultToJson(this);
}

@JsonSerializable()
class AssetInfo {
  AssetInfo({
    this.price = 0.0,
    this.remark = "",
    this.id = 0,
    this.title = "",
    this.createDate = "",
    this.status = "",
  });

  double? price;
  String? remark;
  int? id;
  String? title;
  String? createDate;
  String? status;

  factory AssetInfo.fromJson(Map<String, dynamic> json) => _$AssetInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AssetInfoToJson(this);
}
