import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moody/main.dart';
import 'package:moody/utilities/palette.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool toggle = false; // 다크모드 아이콘만 변경
  final secureStorage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
            ? Palette.lightGrey
            : Palette.tickBlack,
        appBar: AppBar(
          backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
              ? Palette.lightGrey
              : Palette.tickBlack,
          elevation: 0,
          toolbarHeight: _height * 0.05,
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                    child: Text('모드 설정',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600))),
                Container(
                    decoration: BoxDecoration(
                        color: MyApp.themeNotifier.value == ThemeMode.light
                            ? Palette.lightGrey
                            : Palette.black,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Palette.darkGrey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 15,
                              offset: Offset.zero)
                        ]),
                    child: IconButton(
                        onPressed: () {
                          MyApp.themeNotifier.value =
                              MyApp.themeNotifier.value == ThemeMode.light
                                  ? ThemeMode.dark
                                  : ThemeMode.light;
                        },
                        icon: MyApp.themeNotifier.value == ThemeMode.light
                            ? Icon(Icons.light_mode)
                            : Icon(
                                Icons.dark_mode,
                                color: Palette.darkGrey,
                              ))),
              ],
            ), //다크모드
            SizedBox(height: 20),
            Divider(
              indent: 25.0,
              endIndent: 25.0,
              thickness: 1.0,
              color: MyApp.themeNotifier.value == ThemeMode.light
                  ? Palette.darkGrey
                  : Palette.white.withOpacity(0.5),
            ),
            SizedBox(height: 70),
            Spacer(),
            Center(
                child: Text('로그아웃',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: MyApp.themeNotifier.value == ThemeMode.light
                          ? Palette.darkGrey
                          : Palette.white,
                    ))), //로그아웃
            SizedBox(height: 20),
            Container(
                child: IconButton(
                    onPressed: () async {
                      //MARK: LOGOUT WITH NAVIGATE TO LOGIN SCREEN
                      await secureStorage.delete(key: "loginKey");
                      Navigator.pushNamed(context, "/login");
                    },
                    icon: Icon(Icons.logout_outlined))),
          ],
        )));
  }
}
