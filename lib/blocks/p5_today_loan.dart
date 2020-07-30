import 'dart:math';

import 'package:dashboard/charts/pie_chart3.dart';
import 'package:dashboard/items/optionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../charts/indicator.dart';

class TodayLoan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodayLoanState();
}

class _TodayLoanState extends State<TodayLoan> {
  int shirts;
  int pants;
  int jackets;
  int accessories;
  int total;
  @override
  void initState() {
    shirts = Random().nextInt(1000);
    pants = Random().nextInt(1000);
    jackets = Random().nextInt(1000);
    accessories = Random().nextInt(1000);
    total = shirts + pants + jackets + accessories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isMobile = height > width;
    return Container(
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
      margin: isMobile ? EdgeInsets.all(1) : EdgeInsets.only(right: 20.w),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, top: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Loan by Categories",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.w),
                  child: OptionButton(
                    txSize: 10.w,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Indicator(
                  color: Color(0xff0293ee),
                  text: 'Shirts',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'Pants',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Indicator(
                  color: Color(0xff845bef),
                  text: 'Jackets',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: 'Accessories',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18.h,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 80.w),
            child: DonutPieChart(
              animate: true,
              shirts: shirts,
              pants: pants,
              jackets: jackets,
              accessories: accessories,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 80.w),
            alignment: Alignment.center,
            child: Text(
              "$total",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40.w,
              ),
            ),
          )
        ],
      ),
    );
  }
}
