import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';

part 'insurance_qrcode_response.g.dart';

@JsonSerializable()
class InsuranceQrcodeResponse extends ApiResponse<List<InsuranceQrcodeResult>> {
  InsuranceQrcodeResponse({super.msg, super.code, super.data, super.extend});

  factory InsuranceQrcodeResponse.fromJson(Map<String, dynamic> json) => _$InsuranceQrcodeResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InsuranceQrcodeResponseToJson(this);
}

@JsonSerializable()
class InsuranceQrcodeResult {
  InsuranceQrcodeResult({
    this.imgUrl = "",
    this.qrKind = "",
  });

  String imgUrl;
  String qrKind;

  factory InsuranceQrcodeResult.fromJson(Map<String, dynamic> json) => _$InsuranceQrcodeResultFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceQrcodeResultToJson(this);
}
