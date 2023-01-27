import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//MARK: 최상위 위젯
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moody',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const Text("Hi, My name is Moody!"),
    );
  }
}
