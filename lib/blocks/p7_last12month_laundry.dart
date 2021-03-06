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
                    color: Theme.of(context).accentColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Monthly Performance",
                        style: Theme.of(context).textTheme.headline2,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200.w,
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Monthly Performance",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      OptionButton(
                        txSize: 8.w,
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
