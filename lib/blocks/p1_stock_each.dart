import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../items/clothIcon.dart';
import '../charts/pie_chart.dart';
import '../items/optionButton.dart';

class StockEach extends StatefulWidget {
  @override
  _StockEachState createState() => _StockEachState();
}

class _StockEachState extends State<StockEach> {
  int shirts;
  int trousers;
  int jackets;
  int accessories;

  @override
  void initState() {
    shirts = Random().nextInt(1000);
    trousers = Random().nextInt(1000);
    jackets = Random().nextInt(1000);
    accessories = Random().nextInt(1000);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isMobile = height > width;

    Container _stockCard(String variety, double stockPercent) {
      IconData cloth = (variety == "T-shirt")
          ? ClothIcons.Tshirt
          : (variety == "Trousers")
              ? ClothIcons.Trousers
              : (variety == "Jacket")
                  ? ClothIcons.Jacket
                  : ClothIcons.Accessories;
      return isMobile
          ? Container(
              width: 180.w,
              height: 125.h,
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 75.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
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
                      Container(
                        margin: EdgeInsets.only(right: 20.w, top: 10.w),
                        child: Stack(
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
                                  fontSize: 10.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 180.w,
                    height: 50.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5.w),
                          child: Text(
                            "Stock On Hand of \n $variety",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 5.w,
                            ),
                          ),
                        ),
                        OptionButton(txSize: 5.w),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: 240.w,
              height: 85.h,
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
                    height: 85.h,
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
                            fontSize: 10.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 90.w,
                    height: 70.h,
                    margin: EdgeInsets.only(right: 10.w),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Stock On Hand of $variety",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 10.w,
                          ),
                        ),
                        OptionButton(txSize: 5.w),
                      ],
                    ),
                  ),
                ],
              ),
            );
    }

    return isMobile
        ? Container(
            constraints: BoxConstraints.expand(),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _stockCard("T-shirt", (shirts / 10).toDouble()),
                    _stockCard("Trousers", (trousers / 10).toDouble()),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _stockCard("Jacket", (jackets / 10).toDouble()),
                    _stockCard("Accessories", (accessories / 10).toDouble()),
                  ],
                ),
              ],
            ),
          )
        : Container(
            constraints: BoxConstraints.expand(),
            margin: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _stockCard("T-shirt", (shirts / 10).toDouble()),
                _stockCard("Trousers", (trousers / 10).toDouble()),
                _stockCard("Jacket", (jackets / 10).toDouble()),
                _stockCard("Accessories", (accessories / 10).toDouble()),
              ],
            ),
          );
  }
}
