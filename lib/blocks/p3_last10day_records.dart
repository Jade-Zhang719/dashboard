import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

import '../charts/line_chart.dart';
import '../items/optionButton.dart';

class LastTenRecords extends StatefulWidget {
  @override
  _LastTenRecordsState createState() => _LastTenRecordsState();
}

class _LastTenRecordsState extends State<LastTenRecords> {
  int loanQty;
  int returnQty;

  @override
  void initState() {
    loanQty = Random().nextInt(1000);
    returnQty = Random().nextInt(1000);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      margin: EdgeInsets.only(left: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Last 10 Days Records ",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Loan: $loanQty  Return: $returnQty",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15.w,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: OptionButton(txSize: 10.w),
              ),
            ],
          ),
          RecordsLineChart(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.only(right: 20.w),
                      width: 30.w,
                      height: 30.w,
                    ),
                    Text(
                      "Loan",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20.w,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      margin: EdgeInsets.only(right: 20.w),
                      width: 30.w,
                      height: 30.w,
                    ),
                    Text(
                      "Return",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20.w,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
