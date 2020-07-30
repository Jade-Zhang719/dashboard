import 'dart:math';

import 'package:dashboard/charts/gauge_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../items/optionButton.dart';

// ignore: must_be_immutable
class RangeDataLabel extends StatefulWidget {
  final isDark;

  const RangeDataLabel({Key key, this.isDark}) : super(key: key);
  @override
  _RangeDataLabelState createState() => _RangeDataLabelState();
}

class _RangeDataLabelState extends State<RangeDataLabel> {
  int totalStock;
  int stockOnHand;
  double percentage;
  bool isDark;

  @override
  void initState() {
    totalStock = Random().nextInt(1000);
    stockOnHand = Random().nextInt(totalStock);
    percentage = stockOnHand / totalStock * 100;
    isDark = widget.isDark;
    super.initState();
  }

  @override
  void didUpdateWidget(RangeDataLabel oldWidget) {
    setState(() {
      isDark = widget.isDark;
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isMobile = height > width;

    return isMobile
        ? Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.only(left: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                )
              ],
              color: (isDark) ? Theme.of(context).primaryColor : Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Total Stock On Hand",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12.w,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      OptionButton(
                        txSize: 10.w,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 200.w,
                    height: 200.w,
                    padding: EdgeInsets.only(top: 20.w, right: 20.w),
                    child: new GaugeForStockLevel(
                      percentage: percentage,
                    ),
                  ),
                )
              ],
            ),
          )
        : Container(
            constraints: BoxConstraints.expand(),
            margin: EdgeInsets.fromLTRB(0, 20.w, 20.w, 20.w),
            padding: EdgeInsets.only(left: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey,
              //     offset: Offset(2.0, 2.0),
              //     blurRadius: 5.0,
              //     spreadRadius: 2.0,
              //   )
              // ],
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Total Stock On Hand",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15.w,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      OptionButton(
                        txSize: 10.w,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 400.w,
                    height: 400.w,
                    padding: EdgeInsets.only(top: 20.w, right: 20.w),
                    child: GaugeForStockLevel(
                      percentage: percentage,
                      isDark: isDark,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
