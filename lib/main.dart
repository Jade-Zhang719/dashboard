import 'package:charts_common/common.dart' as common;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'blocks/p1_stock_each.dart';
import 'blocks/p2_stock_level.dart';
import 'blocks/p3_last10day_records.dart';
import 'blocks/p4_last10day_detail.dart';
import 'blocks/p5_today_loan.dart';
import 'blocks/p6_rating_table.dart';
import 'blocks/p7_last12month_laundry.dart';
import 'items/style.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  common.StyleFactory.style = CustomMaterialStyle();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  int screenType = 2;
  void onChangedTheme(val) {
    setState(() {
      isDark = val;
    });
  }

  void onChangedScreen(val) {
    setState(() {
      screenType = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard",
      theme: screenType == 1
          //web
          ? ThemeData(
              primaryColor: isDark ? Color(0xff262545) : Colors.blue,
              accentColor: isDark ? Color(0xff32315e) : Colors.blue[50],
              scaffoldBackgroundColor:
                  isDark ? Color(0xff2f2d3b) : Colors.indigo[50],
              cardColor: isDark ? Color(0xff45415c) : Colors.white,
              textTheme: TextTheme(
                headline1: TextStyle(
                  color: isDark ? Colors.blue : Colors.blueGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                headline2: TextStyle(
                  color: isDark ? Colors.blue : Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                headline3: TextStyle(
                  color: isDark ? Colors.blue : Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                headline4: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
                bodyText1: TextStyle(
                  color: isDark ? Colors.blue : Colors.blueGrey,
                  fontSize: 10,
                ),
                bodyText2: TextStyle(
                  color: isDark ? Colors.white : Colors.blueGrey,
                  fontSize: 10,
                ),
              ),
            )
          : screenType == 2
              //mobile
              ? ThemeData(
                  primaryColor: isDark ? Color(0xff262545) : Colors.blue,
                  accentColor: isDark ? Color(0xff32315e) : Colors.blue[50],
                  scaffoldBackgroundColor:
                      isDark ? Color(0xff2f2d3b) : Colors.indigo[50],
                  cardColor: isDark ? Color(0xff45415c) : Colors.white,
                  textTheme: TextTheme(
                    headline1: TextStyle(
                      color: isDark ? Colors.blue : Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    headline2: TextStyle(
                      color: isDark ? Colors.blue : Colors.blueGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    headline3: TextStyle(
                      color: isDark ? Colors.blue : Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    headline4: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                    ),
                    bodyText1: TextStyle(
                      color: isDark ? Colors.blue : Colors.blueGrey,
                      fontSize: 8,
                    ),
                    bodyText2: TextStyle(
                      color: isDark ? Colors.white : Colors.blueGrey,
                      fontSize: 8,
                    ),
                  ),
                )
              : //tablet
              ThemeData(
                  primaryColor: isDark ? Color(0xff262545) : Colors.blue,
                  accentColor: isDark ? Color(0xff32315e) : Colors.blue[50],
                  scaffoldBackgroundColor:
                      isDark ? Color(0xff2f2d3b) : Colors.indigo[50],
                  cardColor: isDark ? Color(0xff45415c) : Colors.white,
                  textTheme: TextTheme(
                    headline1: TextStyle(
                      color: isDark ? Colors.blue : Colors.blueGrey,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    headline2: TextStyle(
                      color: isDark ? Colors.blue : Colors.blueGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    headline3: TextStyle(
                      color: isDark ? Colors.blue : Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    headline4: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                    bodyText1: TextStyle(
                      color: isDark ? Colors.blue : Colors.blueGrey,
                      fontSize: 10,
                    ),
                    bodyText2: TextStyle(
                      color: isDark ? Colors.white : Colors.blueGrey,
                      fontSize: 10,
                    ),
                  ),
                ),
      home: MyHomePage(
        theme: (value) => onChangedTheme(value),
        screen: (value) => onChangedScreen(value),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final theme;
  final screen;
  const MyHomePage({Key key, this.theme, this.screen}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDark = false;
  int screenType = 2;
  @override
  Widget build(BuildContext context) {
    //Tablet : 1366 x 1024
    //956.2 716.8
    //Mobile : 375 X 667
    //PC     : 1536 X 754.4
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    print(height);
    if (width / height > 1.5) {
      Future.delayed(Duration(milliseconds: 100)).then((e) {
        if (screenType != 1)
          setState(() {
            screenType = 1; //web
            widget.screen(screenType);
          });
      });
    } else if (width / height < 1) {
      Future.delayed(Duration(milliseconds: 100)).then((e) {
        if (screenType != 2)
          setState(() {
            screenType = 2; //mobile
            widget.screen(screenType);
          });
      });
    } else {
      Future.delayed(Duration(milliseconds: 100)).then((e) {
        if (screenType != 3)
          setState(() {
            screenType = 3; //tablet
            widget.screen(screenType);
          });
      });
    }
    bool isMobile = height > width;
    isMobile
        ? ScreenUtil.init(
            context,
            width: 375,
            height: 667,
            allowFontScaling: true,
          )
        : ScreenUtil.init(
            context,
            width: 1536,
            height: 754.4,
            allowFontScaling: true,
          );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dashboard",
        ),
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {
                isDark = !isDark;
                widget.theme(isDark);
              });
            },
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: screenType == 2
            ? Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: width,
                height: height,
                padding: EdgeInsets.all(5.w),
                child: ListView(
                  children: [
                    Container(
                      height: 255.h,
                      child: StockEach(screenType: screenType),
                    ),
                    Container(
                      height: 200.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5.w, bottom: 10.w),
                      child: RangeDataLabel(
                        isDark: isDark,
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      height: 250.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5.w),
                      child: LastTenRecords(),
                    ),
                    Container(
                      height: 300.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5.w, bottom: 10.w),
                      child: LastTenDetails(screenType: screenType),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      height: 360.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10.w, bottom: 10.w),
                      child: TodayLoan(
                        isDark: isDark,
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      height: 140.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10.w, bottom: 10.w),
                      child: RatingTable(
                        isDark: isDark,
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      height: 380.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10.w),
                      child: LastYearLaundry(),
                    ),
                  ],
                ),
              )
            : Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.w, 20.w, 10.w, 10.w),
                              child: StockEach(screenType: screenType),
                            ),
                          ),
                          Expanded(
                            flex: 15,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        20.w, 10.w, 10.w, 10.w),
                                    child: LastTenRecords(),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        10.w, 10.w, 10.w, 10.w),
                                    child:
                                        LastTenDetails(screenType: screenType),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.w, 10.w, 10.w, 20.w),
                              child: LastYearLaundry(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Expanded(
                              flex: 7,
                              child: Container(
                                constraints: BoxConstraints.expand(),
                                margin:
                                    EdgeInsets.fromLTRB(10.w, 20.w, 20.w, 10.w),
                                padding: EdgeInsets.only(left: 20.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).cardColor,
                                ),
                                child: new RangeDataLabel(
                                  isDark: isDark,
                                ),
                              )),
                          Expanded(
                            flex: 9,
                            child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(10.w, 10.w, 20.w, 10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context).cardColor,
                              ),
                              child: TodayLoan(
                                isDark: isDark,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(10.w, 10.w, 20.w, 20.w),
                              child: RatingTable(
                                isDark: isDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
