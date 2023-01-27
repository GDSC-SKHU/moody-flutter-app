import 'package:flutter/material.dart';
import 'package:moody/utilities/palette.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key? key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Container(
      color: Palette.white,
      height: _height * 0.8,
      width: _width * 0.9,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: children),
    );
  }
}
