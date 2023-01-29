import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moody/providers/moodys.dart';
import 'package:moody/utilities/constants.dart';

class HttpServices {
  final secureStorage = FlutterSecureStorage();

  Future<Moodys> getMoodys() async {
    const url = Constants.BASE_URL;
    String? token = await secureStorage.read(key: "loginKey");
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Authorzation": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var code = response.statusCode;
      var body = utf8.decode(response.bodyBytes);
      print("$code + $body");
    } else {
      print("서버와의 통신에 실패했어요. $token");
    }
    var data = json.decode(utf8.decode(response.bodyBytes));
    return Moodys.fromJson(data);
  }
}
