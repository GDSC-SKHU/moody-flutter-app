import 'package:flutter/material.dart';
import 'package:moody/main.dart';
import 'package:moody/utilities/palette.dart';
import 'package:moody/utilities/services.dart';
import 'package:moody/widgets/moody_button.dart';
import 'package:moody/widgets/moody_quote_block.dart';
import 'package:moody/widgets/moody_summary_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HttpServices httpServices = HttpServices();
  var userName = "";

  @override
  void initState() {
    super.initState();

    httpServices;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final _getMoodys = httpServices.getMoodys();
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
              ? Palette.lightGrey
              : Palette.tickBlack,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
                ? Palette.lightGrey
                : Palette.tickBlack,
            toolbarHeight: _height * 0.05,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    //MARK: NAVIGATE TO SETTING SCREEN
                    Navigator.pushNamed(context, "/setting");
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Palette.darkGrey,
                    size: 25,
                  ))
            ],
          ),
          body: SafeArea(
            child: RefreshIndicator(
                backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
                    ? Palette.lightGrey
                    : Palette.black,
                color: MyApp.themeNotifier.value == ThemeMode.light
                    ? Palette.darkGrey
                    : Palette.lightGrey,
                onRefresh: () async {
                  //MARK: SET STATE
                  setState(() {
                    _getMoodys;
                  });
                  await Future.delayed(Duration(milliseconds: 1000));
                },
                child: FutureBuilder(
                  future: _getMoodys,
                  builder: ((BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      var saying = data!.saying;
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: _height * 1,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Center(
                                    child: Text(
                                  "당신을 위한 한마디",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                    color: MyApp.themeNotifier.value ==
                                            ThemeMode.light
                                        ? Palette.darkGrey
                                        : Palette.white,
                                  ),
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Center(
                                    child: QuoteBlock(
                                        child: Center(
                                          child: Text("$saying",
                                              style: TextStyle(
                                                  color: MyApp.themeNotifier
                                                              .value ==
                                                          ThemeMode.light
                                                      ? Palette.black
                                                      : Palette.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0)),
                                        ),
                                        height: _height * 0.09,
                                        width: _width * 0.9)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Center(child: SummaryContainer(
                                    onClick: (value) {
                                      //MARK: SHOW BUTTON
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              elevation: 0,
                                              backgroundColor: Palette.white,
                                              titleTextStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Palette.darkGrey,
                                                  fontSize: 17.0),
                                              title: Text(
                                                  "${value.year}년${value.month}월${value.day}일"),
                                              content:
                                                  const Text("기분이 어떤지 알려줘~"),
                                              actions: [
                                                Row(children: [
                                                  MoodyButton(
                                                      width: _width * 0.2,
                                                      height: _height * 0.05,
                                                      onTap: () async {},
                                                      child: Center(
                                                          child: const Text(
                                                              "그럭저럭"))),
                                                  MoodyButton(
                                                      width: _width * 0.2,
                                                      height: _height * 0.05,
                                                      onTap: () {},
                                                      child: Center(
                                                          child: const Text(
                                                              "좋아"))),
                                                  MoodyButton(
                                                      width: _width * 0.2,
                                                      height: _height * 0.05,
                                                      onTap: () {},
                                                      child: Center(
                                                          child: const Text(
                                                              "너무좋아"))),
                                                ])
                                              ],
                                            );
                                          });
                                    },
                                  ))),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: MyApp.themeNotifier.value == ThemeMode.light
                            ? Palette.darkGrey
                            : Palette.white,
                      ));
                    }
                  }),
                )),
          ),
        ));
  }
}
