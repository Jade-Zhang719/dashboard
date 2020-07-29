import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_core/core.dart';

import 'blocks/p1_stock_each.dart';
import 'blocks/p2_stock_level.dart';
import 'blocks/p3_last10day_records.dart';
import 'blocks/p4_last10day_detail.dart';
import 'blocks/p5_today_loan.dart';
import 'blocks/p6_rating_table.dart';
import 'blocks/p7_last12month_laundry.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

// Register your license here
  SyncfusionLicense.registerLicense(null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Tablet : 1366 x 1024
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
      ),
      body: Center(
        child: isMobile
            ? Container(
                color: Colors.indigo[50],
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
                      child: LastTenDetails(),
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
                color: Colors.indigo[50],
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
                                  child: LastTenDetails(),
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
                            child: RangeDataLabel(),
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
