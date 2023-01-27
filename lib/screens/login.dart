import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moody/utilities/palette.dart';
import 'package:moody/widgets/moody_login_container.dart';
import 'package:moody/screens/signup.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// class LoginContainer extends StatelessWidget {
//   const LoginContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final _height = MediaQuery.of(context).size.height;
//     final _width = MediaQuery.of(context).size.width;

//     return Container(
//       color: Colors.blueAccent,
//       height: _height * 0.5,
//       width: _width * 0.5,
//     );
//   }
// }

class _LoginScreenState extends State<LoginScreen> {
  final idTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: LoginContainer(children: [
          //상단 로그인 글씨
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 45),
            child: Text(
              '로그인',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                shadows: [
                  Shadow(
                    blurRadius: 10.0, // shadow blur
                    color: Palette.darkGrey, // shadow color
                    offset: Offset(0.8, 0.8), // how much shadow will be shown
                  ),
                ],
              ),
            ),
          ),

          //아이디 입력
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: TextField(
                style: TextStyle(shadows: [
                  Shadow(
                    blurRadius: 10.0, // shadow blur
                    color: Palette.darkGrey, // shadow color
                    offset: Offset(2.0, 2.0), // how much shadow will be shown
                  ),
                ]),
                controller: idTextController,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        )),
                    labelText: 'Id',
                    labelStyle: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 30.0, // shadow blur
                          color: Palette.darkGrey, // shadow color
                          offset:
                              Offset(2.0, 2.0), // how much shadow will be shown
                        ),
                      ],
                    )),
              ),
            ),
          ),

          //패스워드 입력
          Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: TextField(
              controller: passwordTextController,
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    )),
                labelText: 'PassWord',
                labelStyle: TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: 30.0, // shadow blur
                      color: Palette.darkGrey, // shadow color
                      offset: Offset(2.0, 2.0), // how much shadow will be shown
                    ),
                  ],
                ),
              ),
              obscureText: true,
            ),
          ),

          //회원가입하기 버튼
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_add_alt,
                            color: Colors.black,
                          ),
                          Text(
                            '  회원가입하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0, // shadow blur
                                  color: Palette.darkGrey, // shadow color
                                  offset: Offset(2.0,
                                      2.0), // how much shadow will be shown
                                ),
                              ],
                            ),
                          ),
                          RiveAnimation.asset('assets/riv/check.riv',

                              ///아까 지정한 스테이트 머신이름을 입력
                              stateMachines: ["checkState"],
                              onInit: (_) {}),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //회원가입
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 23, 0, 0),
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.login,
                            color: Colors.black,
                          ),
                          Text(
                            '  로그인하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0, // shadow blur
                                  color: Palette.darkGrey, // shadow color
                                  offset: Offset(2.0,
                                      2.0), // how much shadow will be shown
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      )),
      // LoginContainer();
    );
  }
}
