import '../entity/user.dart';

class UserLoginResponse {
  User? user;
  String? accessToken;

  UserLoginResponse({this.user, this.accessToken});

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['accessToken'] = accessToken;
    return data;
  }
}
