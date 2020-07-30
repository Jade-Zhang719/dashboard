import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blocks/p1_stock_each.dart';
import 'blocks/p2_stock_level.dart';
import 'blocks/p3_last10day_records.dart';
import 'blocks/p4_last10day_detail.dart';
import 'blocks/p5_today_loan.dart';
import 'blocks/p6_rating_table.dart';
import 'blocks/p7_last12month_laundry.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
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
  void onChanged(val) {
    setState(() {
      isDark = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard",
      theme: ThemeData(
        primaryColor: isDark ? Color(0xff262545) : Colors.blue,
        scaffoldBackgroundColor: isDark ? Color(0xff2f2d3b) : Colors.indigo[50],
        cardColor: isDark ? Color(0xff45415c) : Colors.white,
      ),
      home: MyHomePage(callback: (value) => onChanged(value)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final callback;

  const MyHomePage({Key key, this.callback}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDark = false;

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
                widget.callback(isDark);
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
        child: isMobile
            ? Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: width,
                height: height,
                padding: EdgeInsets.all(5.w),
                child: ListView(
                  children: [
                    Container(
                      height: 260.h,
                      child: StockEach(),
                    ),
                    Container(
                      height: 200.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5.w, bottom: 10.w),
                      child: RangeDataLabel(),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      height: 335.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5.w),
                      child: LastTenRecords(),
                    ),
                    Container(
                      height: 360.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5.w, bottom: 10.w),
                      child: LastTenDetails(
                        isDark: isDark,
                      ),
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
                      child: TodayLoan(),
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
                      child: RatingTable(),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      height: 250.h,
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
                            child: StockEach(),
                          ),
                          Expanded(
                            flex: 15,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: LastTenRecords(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: LastTenDetails(
                                    isDark: isDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: LastYearLaundry(),
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
                            child: new RangeDataLabel(
                              isDark: isDark,
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: TodayLoan(),
                          ),
                          Expanded(
                            flex: 6,
                            child: RatingTable(),
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
