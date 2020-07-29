import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

import '../items/optionButton.dart';

// ignore: must_be_immutable
class RangeDataLabel extends StatefulWidget {
  @override
  _RangeDataLabelState createState() => _RangeDataLabelState();
}

class _RangeDataLabelState extends State<RangeDataLabel> {
  int totalStock;
  int stockOnHand;
  double percentage;

  @override
  void initState() {
    totalStock = Random().nextInt(1000);
    stockOnHand = Random().nextInt(totalStock);
    percentage = stockOnHand / totalStock * 100;
    super.initState();
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
              color: Colors.white,
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
                    child: KdGaugeView(
                      innerCirclePadding: 10.w,
                      unitOfMeasurement: "Stock Level (%)",
                      unitOfMeasurementTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 8.w),
                      minMaxTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 5.w),
                      speedTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.w),
                      minSpeed: 0,
                      maxSpeed: 100,
                      speed: percentage,
                      animate: true,
                      alertSpeedArray: [40, 80, 100],
                      alertColorArray: [
                        Colors.orange,
                        Colors.indigo,
                        Colors.red
                      ],
                      duration: Duration(seconds: 1),
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
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                )
              ],
              color: Colors.white,
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
                    child: KdGaugeView(
                      innerCirclePadding: 10.w,
                      unitOfMeasurement: "Stock Level (%)",
                      unitOfMeasurementTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 5.w),
                      minMaxTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 5.w),
                      speedTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.w),
                      minSpeed: 0,
                      maxSpeed: 100,
                      speed: percentage,
                      animate: true,
                      alertSpeedArray: [40, 80, 100],
                      alertColorArray: [
                        Colors.orange,
                        Colors.indigo,
                        Colors.red
                      ],
                      duration: Duration(seconds: 1),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
