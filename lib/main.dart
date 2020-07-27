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
import 'charts/range_data.dart';

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
    ScreenUtil.init(
      context,
      width: 1536,
      height: 754.4,
      allowFontScaling: true,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard"),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.indigo[50],
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: StockEach(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: RangeDataLabel(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 13,
                                  child: Container(
                                    child: LastTenRecords(),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    child: LastTenDetails(),
                                  ),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Container(
                                    child: TodayLoan(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  child: LastYearLaundry(),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: RatingTable(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 160.w,
                height: 150.h,
                child: getRangeDataLabelExample(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
