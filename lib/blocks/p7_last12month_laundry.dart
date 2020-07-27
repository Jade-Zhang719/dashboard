import '../charts/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastYearLaundry extends StatefulWidget {
  @override
  _LastYearLaundryState createState() => _LastYearLaundryState();
}

class _LastYearLaundryState extends State<LastYearLaundry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200.w,
            height: 150.h,
            alignment: Alignment.center,
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
              color: Colors.blue[50],
            ),
            child: Text(
              "Last 12 months Laundry data ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25.w,
              ),
            ),
          ),
          RecordsBarChart(),
        ],
      ),
    );
  }
}
