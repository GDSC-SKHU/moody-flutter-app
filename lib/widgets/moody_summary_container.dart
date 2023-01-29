import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:moody/main.dart';
import 'package:moody/utilities/date_time.dart';
import 'package:moody/utilities/palette.dart';

class SummaryContainer extends StatelessWidget {
  const SummaryContainer({Key? key, required this.onClick});

  final Function(DateTime) onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      child: HeatMapCalendar(
          onClick: onClick,
          datasets: {
            DateTime(2023, 1, 6): 1,
            DateTime(2023, 1, 7): 3,
            DateTime(2023, 1, 8): 2,
            DateTime(2023, 1, 9): 3,
            DateTime(2023, 1, 10): 1,
            DateTime(2023, 1, 11): 1,
            DateTime(2023, 1, 12): 2,
            DateTime(2023, 1, 13): 2,
            DateTime(2023, 1, 14): 2,
            DateTime(2023, 1, 15): 2,
            DateTime(2023, 1, 16): 2,
            DateTime(2023, 1, 17): 3,
            DateTime(2023, 1, 18): 1,
            DateTime(2023, 1, 19): 3,
            DateTime(2023, 1, 20): 3,
            DateTime(2023, 1, 21): 3,
            DateTime(2023, 1, 22): 3,
            DateTime(2023, 1, 23): 3,
            DateTime(2023, 1, 24): 2,
            DateTime(2023, 1, 25): 1,
            DateTime(2023, 1, 26): 3,
            DateTime(2023, 1, 27): 2,
            DateTime(2023, 1, 28): 1,
          },
          showColorTip: false,
          weekTextColor: MyApp.themeNotifier.value == ThemeMode.light
              ? Palette.darkGrey
              : Palette.white,
          size: 45,
          colorMode: ColorMode.color,
          defaultColor: Palette.lightGrey,
          monthFontSize: 15.0,
          textColor: Palette.white,
          colorsets: Palette.lightmaps),
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
