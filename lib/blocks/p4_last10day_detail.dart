import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../charts/line_chart2.dart';

class LastTenDetails extends StatefulWidget {
  final isDark;

  const LastTenDetails({Key key, this.isDark}) : super(key: key);
  @override
  _LastTenDetailsState createState() => _LastTenDetailsState();
}

class _LastTenDetailsState extends State<LastTenDetails> {
  int shirts;
  int pants;
  int jackets;
  int accessories;
  int total;
  bool isDark;
  @override
  void initState() {
    shirts = Random().nextInt(1000);
    pants = Random().nextInt(1000);
    jackets = Random().nextInt(1000);
    accessories = Random().nextInt(1000);
    total = shirts + pants + jackets + accessories;
    isDark = widget.isDark;
    super.initState();
  }

  @override
  void didUpdateWidget(LastTenDetails oldWidget) {
    isDark = widget.isDark;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Container _stockCard(String variety, int amount) {
      return Container(
        width: 360.w,
        height: 85.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      variety,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.w,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Loan by last 10 days",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 8.w,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      "$amount",
                      style: TextStyle(
                          color: Color(0xff2F4860),
                          fontSize: 20.w,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: LineChartSample2(
                isDark: isDark,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _stockCard("T-shirt", shirts),
          _stockCard("Trousers", pants),
          _stockCard("Jacket", jackets),
          _stockCard("Accessories", accessories),
        ],
      ),
    );
  }
}
