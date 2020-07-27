import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../clothIcon.dart';
import '../charts/pie_chart.dart';

class StockEach extends StatefulWidget {
  @override
  _StockEachState createState() => _StockEachState();
}

class _StockEachState extends State<StockEach> {
  @override
  Widget build(BuildContext context) {
    Container _stockCard(String variety, double stockPercent) {
      IconData cloth = (variety == "T-shirt")
          ? ClothIcons.Tshirt
          : (variety == "Trousers")
              ? ClothIcons.Trousers
              : (variety == "Jacket")
                  ? ClothIcons.Jacket
                  : ClothIcons.Accessories;
      return Container(
        width: 240.w,
        height: 75.h,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 75.w,
              height: 75.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                color: Colors.blue[50],
              ),
              child: Icon(
                cloth,
                color: Colors.blue,
                size: 50.w,
              ),
            ),
            Stack(
              children: [
                StockPieChart(value: stockPercent),
                Container(
                  width: 60.w,
                  height: 60.w,
                  alignment: Alignment.center,
                  child: Text(
                    "${stockPercent.toString()}%",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15.w,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 90.w,
              margin: EdgeInsets.only(right: 10.w),
              alignment: Alignment.center,
              child: Text(
                variety,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15.w,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      constraints: BoxConstraints.expand(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _stockCard("T-shirt", 40),
          _stockCard("Trousers", 30),
          _stockCard("Jacket", 10),
          _stockCard("Accessories", 100),
        ],
      ),
    );
  }
}
