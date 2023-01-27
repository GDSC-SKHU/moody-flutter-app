import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moody/screens/home.dart';
import 'package:moody/utilities/palette.dart';
import 'package:moody/widgets/moody_login_container.dart';
import 'package:moody/screens/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final idTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: LoginContainer(children: [
          //상단 회원가입 글씨
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Text(
              '회원가입',
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
            decoration: BoxDecoration(),
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
                    labelText: 'Add Id',
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
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: TextField(
              controller: passwordTextController,
              decoration: InputDecoration(
                icon: Icon(Icons.visibility),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    )),
                labelText: 'Add PassWord',
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
            ),
          ),

          //회원가입완료 버튼
          Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(160, 10, 0, 0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.task_alt,
                        color: Colors.black,
                      ),
                      Text(
                        '  회원가입 완료',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0, // shadow blur
                              color: Palette.darkGrey, // shadow color
                              offset: Offset(
                                  2.0, 2.0), // how much shadow will be shown
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
        ]),
      )),
      // LoginContainer();
    );
  }
}
