import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../charts/bar_chart.dart';
import '../items/optionButton.dart';

class LastYearLaundry extends StatefulWidget {
  @override
  _LastYearLaundryState createState() => _LastYearLaundryState();
}

class _LastYearLaundryState extends State<LastYearLaundry> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isMobile = height > width;
    return isMobile
        ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                    color: Colors.blue[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Monthly Performance",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      OptionButton(
                        txSize: 10.w,
                      ),
                    ],
                  ),
                ),
                RecordsBarChart(),
              ],
            ),
          )
        : Container(
            constraints: BoxConstraints.expand(),
            margin: EdgeInsets.fromLTRB(20.w, 20.w, 10.w, 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200.w,
                  height: 150.h,
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                    color: Colors.blue[50],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Monthly Performance",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      OptionButton(
                        txSize: 10.w,
                      ),
                    ],
                  ),
                ),
                RecordsBarChart(),
              ],
            ),
          );
  }
}
