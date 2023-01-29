import 'package:flutter/material.dart';

class Palette {
  //MARK: COLOR SET
  static const white = Color(0xffFFFFFF);
  static const lightGrey = Color(0xffEDEDED);
  static const darkGrey = Color(0xff858585);
  static const black = Color(0xff3C3C3C);
  static const tickBlack = Color(0xff21262d);
  static const bear = Color(0xffD6E2EA);

  //MARK: LIGHT MODE HEATMAP COLOR SET
  static const lightmaps = {
    1: Color.fromARGB(255, 255, 116, 115),
    2: Color.fromARGB(180, 255, 116, 115),
    3: Color.fromARGB(120, 255, 116, 115)
  };

  //MARK: DARK MODE HEATMAP COLOR SET
  static const darktmaps = {
    1: Color.fromARGB(120, 2, 179, 8),
    2: Color.fromARGB(180, 2, 179, 8),
    3: Color.fromARGB(255, 2, 179, 8)
  };
}
