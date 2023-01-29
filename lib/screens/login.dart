import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moody/main.dart';
import 'package:moody/utilities/authentication.dart';
import 'package:moody/utilities/palette.dart';
import 'package:moody/widgets/moody_login_container.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  dynamic userInfo = null;
  var isObscure = false;
  Authenticator authenticator = Authenticator();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final secureStorage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    //MARK: LOAD TO FLUTTER SECURE STORAGE INFORMATION
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoLogin();
    });
    authenticator;
  }

  _autoLogin() async {
    userInfo = await secureStorage.read(key: "loginKey");
    if (userInfo != null) {
      Navigator.pushNamed(context, "/home");
    } else {
      print("autoLogin Error: userInfo가 존재하지 않아요. 로그인이 필요해요.");
    }
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.bear,
      body: SafeArea(
          child: Center(
        child: LoginContainer(children: [
          Container(
              width: _width * 0.6,
              height: _height * 0.4,
              child: RiveAnimation.asset("assets/riv/check.riv",
                  stateMachines: ["checkState"], onInit: (_) {})),
          //아이디 입력
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      )),
                  labelText: '이름',
                ),
              ),
            ),
          ),

          //패스워드 입력
          Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    )),
                labelText: '비밀번호',
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 50),
          //회원가입하기 버튼
          Center(
            child: Container(
              child: IconButton(
                icon: Icon(
                  Icons.login_outlined,
                  color: Palette.white,
                ),
                onPressed: () async {
                  if (await authenticator.authentication(
                          userNameController.text, passwordController.text) ==
                      true) {
                    Navigator.pushNamed(context, "/home");
                  } else {
                    print("로그인 실패");
                  }
                },
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Palette.darkGrey),
            ),
          ),
        ]),
      )),
    );
  }
}
