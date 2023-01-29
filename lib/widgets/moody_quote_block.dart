import 'package:flutter/material.dart';
import 'package:moody/main.dart';
import 'package:moody/utilities/palette.dart';

class QuoteBlock extends StatelessWidget {
  const QuoteBlock(
      {Key? key,
      required this.height,
      required this.width,
      required this.child});

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: child,
      decoration: BoxDecoration(
          color: MyApp.themeNotifier.value == ThemeMode.light
              ? Palette.white
              : Palette.tickBlack,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Palette.darkGrey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 15,
                offset: Offset.zero)
          ]),
    );
  }
}
