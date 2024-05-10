import 'package:equatable/equatable.dart';
import '../../../domain/response/save_coin_response/save_coin_rate_response.dart';

enum CoinType {
  usdt(1, "USDT"),
  fil(35, "FIL");

  const CoinType(this.value, this.name);

  final int value;
  final String name;
}

class InvestedState extends Equatable {
  const InvestedState({
    this.saveCoinRateResponse,
    this.status = InvestedPageStatus.initial,
    this.usdtItemSelectedIndex = 0,
    this.filItemSelectedIndex = 0,
  });

  final SaveCoinRateResponse? saveCoinRateResponse;
  final InvestedPageStatus status;
  final int usdtItemSelectedIndex;
  final int filItemSelectedIndex;

  InvestedState copyWith({
    SaveCoinRateResponse? saveCoinRateResponse,
    InvestedPageStatus? status,
    int? usdtItemSelectedIndex,
    int? filItemSelectedIndex,
  }) {
    return InvestedState(
      saveCoinRateResponse: saveCoinRateResponse ?? this.saveCoinRateResponse,
      status: status ?? this.status,
      usdtItemSelectedIndex: usdtItemSelectedIndex ?? this.usdtItemSelectedIndex,
      filItemSelectedIndex: filItemSelectedIndex ?? this.filItemSelectedIndex,
    );
  }

  @override
  List<Object> get props => [saveCoinRateResponse ?? SaveCoinRateResponse(), status, usdtItemSelectedIndex];
}

enum InvestedPageStatus { initial, success, failure }
