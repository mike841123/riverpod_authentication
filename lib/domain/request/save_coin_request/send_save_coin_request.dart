class SendSaveCoinRequest {
  final int id; 
  final String investedAmount;
  final int autoSubscribe;
  final String payPassword;

  SendSaveCoinRequest({
    required this.id,
    required this.investedAmount,
    required this.autoSubscribe,
    required this.payPassword,
  });
}
