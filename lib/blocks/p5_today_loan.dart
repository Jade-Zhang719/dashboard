import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../charts/indicator.dart';
import '../charts/pie_chart2.dart';

class TodayLoan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodayLoanState();
}

class _TodayLoanState extends State<TodayLoan> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      margin: EdgeInsets.only(right: 20.w),
      child: Stack(
        children: [
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
          LoanPieChart(),
          Center(
            child: Text(
              "1000",
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
