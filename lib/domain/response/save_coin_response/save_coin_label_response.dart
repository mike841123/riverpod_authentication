import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';

part 'save_coin_label_response.g.dart';

@JsonSerializable()
class SaveCoinLabelResponse extends ApiResponse<List<SaveCoinLabel>> {
  SaveCoinLabelResponse({super.msg, super.code, super.data, super.extend});

  factory SaveCoinLabelResponse.fromJson(Map<String, dynamic> json) => _$SaveCoinLabelResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SaveCoinLabelResponseToJson(this);
}

@JsonSerializable()
class SaveCoinLabel {
  SaveCoinLabel({
    this.coinId = "",
    this.coinName = "",
  });

  String coinId;
  String coinName;

  factory SaveCoinLabel.fromJson(Map<String, dynamic> json) => _$SaveCoinLabelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveCoinLabelToJson(this);
}
