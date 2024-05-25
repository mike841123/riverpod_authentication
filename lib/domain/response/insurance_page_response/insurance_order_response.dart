import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';
import '../list_result.dart';

part 'insurance_order_response.g.dart';

@JsonSerializable()
class InsuranceOrderResponse extends ApiResponse<InsuranceOrderResult> {
  InsuranceOrderResponse({super.msg, super.code, super.data, super.extend});

  factory InsuranceOrderResponse.fromJson(Map<String, dynamic> json) => _$InsuranceOrderResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InsuranceOrderResponseToJson(this);
}

@JsonSerializable()
class InsuranceOrderResult {
  InsuranceOrderResult({
    this.fypBalance = 0,
    this.exchangeAmount = 0,
    this.insuranceOrderInfoPage,
  });

  double fypBalance;
  double exchangeAmount;
  InsuranceOrderInfoPage? insuranceOrderInfoPage;

  factory InsuranceOrderResult.fromJson(Map<String, dynamic> json) => _$InsuranceOrderResultFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceOrderResultToJson(this);
}

@JsonSerializable()
class InsuranceOrderInfoPage extends ListResult<InfoPageItem> {
  InsuranceOrderInfoPage({super.current, super.total, super.pages, super.size, super.records = const [], super.searchCount});

  factory InsuranceOrderInfoPage.fromJson(Map<String, dynamic> json) => _$InsuranceOrderInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceOrderInfoPageToJson(this);
}

@JsonSerializable()
class InfoPageItem {
  InfoPageItem({
    required this.id,
    required this.insuranceTypeName,
    required this.amount,
    required this.exchangeAmount,
    required this.startDate,
    required this.endDate,
    required this.auditStatus,
    required this.insuranceCategoryId,
    required this.insuranceCategoryName,
  });

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "insuranceTypeName")
  String insuranceTypeName;
  @JsonKey(name: "amount")
  int amount;
  @JsonKey(name: "exchangeAmount")
  double exchangeAmount;
  @JsonKey(name: "startDate")
  String startDate;
  @JsonKey(name: "endDate")
  String endDate;
  @JsonKey(name: "auditStatus")
  int auditStatus;
  @JsonKey(name: "insuranceCategoryId")
  int insuranceCategoryId;
  @JsonKey(name: "insuranceCategoryName")
  String insuranceCategoryName;

  factory InfoPageItem.fromJson(Map<String, dynamic> json) => _$InfoPageItemFromJson(json);

  Map<String, dynamic> toJson() => _$InfoPageItemToJson(this);
}
