class UserRegisterRequest {
  String? name;
  String? surname;
  String? password;
  String? email;
  String? telephone;

  UserRegisterRequest(
      {this.name, this.surname, this.password, this.email, this.telephone});

  UserRegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    password = json['password'];
    email = json['email'];
    telephone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['password'] = password;
    data['email'] = email;
    data['telephone'] = telephone;
    return data;
  }
}
