class SaveCoinHistoryRequest {
  final int page;
  final int limit;
  final String? assetType;
  final String? optionType;
  final String? status;
  final String? startTime;
  final String? endTime;

  SaveCoinHistoryRequest({
    required this.page,
    required this.limit,
    this.assetType = "",
    this.optionType = "",
    this.status = "",
    this.startTime = "",
    this.endTime = "",
  });
}
