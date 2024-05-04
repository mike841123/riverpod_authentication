/// 所有 ApiResponse 目錄之下的 response 都需繼承此類
class ApiResponse<T> {
  ApiResponse({this.msg = "", this.code = 1, this.data, this.extend});

  String msg;
  int code;
  T? data;
  dynamic extend;

  factory ApiResponse.fromJson(dynamic json) {
    // retrofit建構.g會無法識別ApiResponse內自定義類，需在下方補充自定義類轉Json的函式
    dynamic parseT(dynamic data) {
      return data;
    }

    return ApiResponse(
      msg: json['msg'] as String? ?? "",
      code: json['code'] as int? ?? 1,
      data: json['data'] == null ? null : parseT(json['data']) as T,
      extend: json['extend'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'msg': msg,
        'code': code,
        'data': data,
        'extend': extend,
      };
}
