import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';

part 'exchange_rate_response.g.dart';

@JsonSerializable()
class ExchangeRateResponse extends ApiResponse<List<Rate>> {
  ExchangeRateResponse({super.msg, super.code, super.data, super.extend});

  factory ExchangeRateResponse.fromJson(Map<String, dynamic> json) => _$ExchangeRateResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ExchangeRateResponseToJson(this);
}

@JsonSerializable()
class Rate {
  Rate({
    required this.countryId,
    required this.currencyCode,
    required this.rate,
  });

  @JsonKey(name: "countryId")
  int countryId;
  @JsonKey(name: "currencyCode")
  String currencyCode;
  @JsonKey(name: "rate")
  double rate;

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);

  Map<String, dynamic> toJson() => _$RateToJson(this);
}
