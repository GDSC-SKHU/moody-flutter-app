import 'package:flutter/material.dart';
import 'package:moody/screens/home.dart';
import 'package:moody/screens/login.dart';
import 'package:moody/screens/setting.dart';

void main() {
  runApp(const MyApp());
}

//MARK: 최상위 위젯
class MyApp extends StatelessWidget {
  //MARK: THEME MODE IS LIGHT? LIGHT : DARK
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
              title: 'Moody',
              theme: ThemeData(useMaterial3: true),
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData.dark(),
              themeMode: currentMode,
              home: HomeScreen(),
              initialRoute: "/setting",
              routes: {
                "/login": (context) => LoginScreen(),
                "/home": (context) => HomeScreen(),
                "/setting": (context) => SettingScreen()
              });
        });
  }
}
