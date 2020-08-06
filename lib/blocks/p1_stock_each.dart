import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../charts/pie_chart1.dart';
import '../items/clothIcon.dart';
import '../items/optionButton.dart';

class StockEach extends StatefulWidget {
  final int screenType;

  const StockEach({Key key, this.screenType}) : super(key: key);
  @override
  _StockEachState createState() => _StockEachState();
}

class _StockEachState extends State<StockEach> {
  int shirts;
  int trousers;
  int jackets;
  int accessories;
  int screenType;
  @override
  void initState() {
    shirts = Random().nextInt(1000);
    trousers = Random().nextInt(1000);
    jackets = Random().nextInt(1000);
    accessories = Random().nextInt(1000);
    screenType = widget.screenType;
    super.initState();
  }

  @override
  void didUpdateWidget(StockEach oldWidget) {
    shirts = Random().nextInt(1000);
    trousers = Random().nextInt(1000);
    jackets = Random().nextInt(1000);
    accessories = Random().nextInt(1000);
    screenType = widget.screenType;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Container _stockCard(String variety, double stockPercent) {
      IconData cloth = (variety == "T-shirt")
          ? ClothIcons.Tshirt
          : (variety == "Trousers")
              ? ClothIcons.Trousers
              : (variety == "Jacket")
                  ? ClothIcons.Jacket
                  : ClothIcons.Accessories;
      return screenType == 2
          ? Container(
              width: 180.w,
              height: 125.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).cardColor,
              ),
              child: Stack(children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 85.w,
                    height: 85.w,
                    child: StockPieChart(value: stockPercent),
                  ),
                ),
                Column(
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
                            color: Theme.of(context).accentColor,
                          ),
                          child: Icon(
                            cloth,
                            color: Colors.blue,
                            size: 50.w,
                          ),
                        ),
                        Container(
                          width: 60.w,
                          height: 60.w,
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(0, 10.w, 10.w, 0),
                          child: Text(
                            "${stockPercent.toString()}%",
                            style: Theme.of(context).textTheme.bodyText2,
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
                              "Stock of \n $variety",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          OptionButton(txSize: 5.w),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            )
          : Container(
              width: width * 0.16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).cardColor,
              ),
              child: AspectRatio(
                aspectRatio: screenType == 1 ? 2.7 : 1.5,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          5.w, screenType == 1 ? 10.w : 35.w, 30.w, 0),
                      child: StockPieChart(value: stockPercent),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints.expand(),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(5),
                              ),
                              color: Theme.of(context).accentColor,
                            ),
                            child: Icon(
                              cloth,
                              color: Colors.blue,
                              size: 45.w,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                alignment: Alignment.center,
                                child: Text(
                                  "Stock of $variety",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10.w, 10.w, 0, 30.w),
                                    child: Center(
                                      child: Text(
                                        "${stockPercent.toString()}%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: OptionButton(txSize: 5.w),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
    }

    return screenType == 2
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
