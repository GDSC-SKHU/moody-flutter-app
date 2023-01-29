import 'package:flutter/material.dart';
import 'package:moody/utilities/palette.dart';

class MoodyButton extends StatelessWidget {
  const MoodyButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.onTap,
      required this.child});

  final double width;
  final double height;
  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        child: child,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Palette.lightGrey,
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
