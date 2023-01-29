import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moody/utilities/constants.dart';

class Authenticator {
  final secureStorage = FlutterSecureStorage();
  authentication(String userName, password) async {
    const url = Constants.LOGIN_URL;
    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "userName": userName,
          "password": password,
        }),
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      String? token = responseBody["accessToken"];
      await secureStorage.write(key: "loginKey", value: token);
      print(token);
      return true;
    } else {
      return false;
    }
  }
}
