import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../charts/line_chart2.dart';

class LastTenDetails extends StatefulWidget {
  final int screenType;

  const LastTenDetails({Key key, this.screenType}) : super(key: key);
  @override
  _LastTenDetailsState createState() => _LastTenDetailsState();
}

class _LastTenDetailsState extends State<LastTenDetails> {
  int shirts;
  int pants;
  int jackets;
  int accessories;
  int total;
  int screenType;
  @override
  void initState() {
    shirts = Random().nextInt(1000);
    pants = Random().nextInt(1000);
    jackets = Random().nextInt(1000);
    accessories = Random().nextInt(1000);
    total = shirts + pants + jackets + accessories;
    screenType = widget.screenType;
    super.initState();
  }

  @override
  void didUpdateWidget(LastTenDetails oldWidget) {
    shirts = Random().nextInt(1000);
    pants = Random().nextInt(1000);
    jackets = Random().nextInt(1000);
    accessories = Random().nextInt(1000);
    total = shirts + pants + jackets + accessories;
    screenType = widget.screenType;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Container _stockCard(String variety, int amount) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).cardColor,
        ),
        padding: EdgeInsets.only(left: 10.w),
        child: AspectRatio(
          aspectRatio: screenType == 3 ? 3.2 : 4.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        variety,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Loan by last 10 days",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      child: Text(
                        "$amount",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: screenType == 3 ? 2 : 4,
                child: LineChartSample2(),
              ),
            ],
          ),
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
