class SaveCoinInterestRequest {
  final int page;
  final int limit;
  final String? assetType;
  final String? optionType;
  final String? startTime;
  final String? endTime;

  SaveCoinInterestRequest({
    required this.page,
    required this.limit,
    this.assetType = "",
    this.optionType = "",
    this.startTime = "",
    this.endTime = "",
  });
}
