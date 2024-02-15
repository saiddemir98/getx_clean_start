class User {
  String? id;
  String? name;
  String? surname;
  String? telephone;
  String? email;

  User({this.id, this.name, this.surname, this.telephone, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    telephone = json['telephone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['telephone'] = telephone;
    data['email'] = email;
    return data;
  }
}
