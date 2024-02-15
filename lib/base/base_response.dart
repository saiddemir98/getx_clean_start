class BaseResponse<T> {
  bool? isSuccess;
  List<String>? messages;
  T? data;

  BaseResponse.fromJson(Map<String, dynamic> json, Constructor<T> constructor) {
    isSuccess = json['isSuccess'] ?? false;
    messages = json['messages'].cast<String>() ;
    data = json['data'] != null ? constructor.call(json['data']) : null;
  }
}

typedef Constructor<T> = T Function(Map<String, dynamic> json);
