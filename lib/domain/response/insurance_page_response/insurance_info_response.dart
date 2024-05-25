import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';

part 'insurance_info_response.g.dart';

@JsonSerializable()
class InsuranceInfoResponse extends ApiResponse<List<InsuranceInfoResult>> {
  InsuranceInfoResponse({super.msg, super.code, super.data, super.extend});

  factory InsuranceInfoResponse.fromJson(Map<String, dynamic> json) => _$InsuranceInfoResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InsuranceInfoResponseToJson(this);
}

@JsonSerializable()
class InsuranceInfoResult {
  InsuranceInfoResult({
    this.id = 0,
    this.countryId = 0,
    this.countryName = "",
    this.areaId = 0,
    this.areaName = "",
    this.insuranceCompanyId = 0,
    this.insuranceCompanyName = "",
    this.insuranceTypeName = "",
    this.commissionRate = 0.0,
    this.insuranceCategoryId = 0,
    this.insuranceCategoryName = "",
  });

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "countryId")
  int countryId;
  @JsonKey(name: "countryName")
  String countryName;
  @JsonKey(name: "areaId")
  int? areaId;
  @JsonKey(name: "areaName")
  String? areaName;
  @JsonKey(name: "insuranceCompanyId")
  int insuranceCompanyId;
  @JsonKey(name: "insuranceCompanyName")
  String insuranceCompanyName;
  @JsonKey(name: "insuranceTypeName")
  String insuranceTypeName;
  @JsonKey(name: "commissionRate")
  double commissionRate;
  @JsonKey(name: "insuranceCategoryId")
  int insuranceCategoryId;
  @JsonKey(name: "insuranceCategoryName")
  String insuranceCategoryName;

  factory InsuranceInfoResult.fromJson(Map<String, dynamic> json) => _$InsuranceInfoResultFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceInfoResultToJson(this);
}
