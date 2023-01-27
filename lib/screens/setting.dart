import 'package:flutter/material.dart';
import 'package:moody/main.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool toggle = false;  // 다크모드 아이콘만 변경

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Center(
              child: Text('다크모드 설정', 
                style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold))),  //다크모드
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                   primary: Colors.amber, 
                   minimumSize: Size(150, 70),
              ),
              label: Text('LIGHT'),
              icon: toggle
                ? Icon(Icons.light_mode)
                : Icon(Icons.dark_mode),
              onPressed: () {
                setState(() { toggle = !toggle; });
              }
            ),
            SizedBox(height: 70),

            Center(child: Text('로그인 설정', 
              style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold))),  //로그아웃
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                   minimumSize: Size(150, 50),
              ),
              label: Text('LOGOUT'),
              icon: Icon(Icons.logout),
              onPressed: () {
                // 로그아웃 + 로그인 화면으로 이동
              },
            ),
          ],
        )
      )
    );
  }
}