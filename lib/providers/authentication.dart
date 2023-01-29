class Authentication {
  String? userName;
  String? password;

  Authentication({this.userName, this.password});

  Authentication.fromJson(Map<String, dynamic> json) {
    userName = json["userName"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["userName"] = userName;
    data["password"] = password;
    return data;
  }
}
