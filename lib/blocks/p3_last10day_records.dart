import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../charts/line_chart.dart';
import '../items/optionButton.dart';

class LastTenRecords extends StatefulWidget {
  final int screenType;

  const LastTenRecords({Key key, this.screenType}) : super(key: key);
  @override
  _LastTenRecordsState createState() => _LastTenRecordsState();
}

class _LastTenRecordsState extends State<LastTenRecords> {
  int screenType;
  int loanQty;
  int returnQty;
  String dropdownValue1 = "Option 1";
  List<String> options1 = [
    "Option 1",
  ];
  String dropdownValue2 = "Option 2";
  List<String> options2 = [
    "Option 2",
  ];
  @override
  void initState() {
    loanQty = Random().nextInt(1000);
    returnQty = Random().nextInt(1000);
    screenType = widget.screenType;
    super.initState();
  }

  @override
  void didUpdateWidget(LastTenRecords oldWidget) {
    loanQty = Random().nextInt(1000);
    returnQty = Random().nextInt(1000);
    screenType = widget.screenType;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return screenType == 2
        ? Container(
            constraints: BoxConstraints.expand(),
            margin: EdgeInsets.only(top: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "Last 10 Days Records ",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Container(
                          child: Text(
                            "Loan: $loanQty  Return: $returnQty",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: OptionButton(txSize: 8.w),
                    ),
                  ],
                ),
                RecordsLineChart(screenType: screenType),
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
                            width: 15.w,
                            height: 15.w,
                          ),
                          Text(
                            "Loan",
                            style: Theme.of(context).textTheme.headline4,
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
                            width: 15.w,
                            height: 15.w,
                          ),
                          Text(
                            "Return",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20.w),
                              child: Text(
                                "Last 10 Days Records ",
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.w),
                              child: Text(
                                "Loan: $loanQty  Return: $returnQty",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 40.h,
                                  child: DropdownButton<String>(
                                    iconSize: 20.w,
                                    dropdownColor: Theme.of(context).cardColor,
                                    value: dropdownValue1,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownValue1 = newValue;
                                      });
                                    },
                                    underline: Container(),
                                    elevation: 6,
                                    items: options1
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          child: Text(
                                            value,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Container(
                                  height: 40.h,
                                  child: DropdownButton<String>(
                                    iconSize: 20.w,
                                    dropdownColor: Theme.of(context).cardColor,
                                    value: dropdownValue2,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownValue2 = newValue;
                                      });
                                    },
                                    underline: Container(),
                                    elevation: 6,
                                    items: options2
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          child: Text(
                                            value,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 10.w),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                margin: EdgeInsets.only(right: 20.w),
                                width: 20.w,
                                height: 20.w,
                              ),
                              Text(
                                "Loan",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                margin: EdgeInsets.only(right: 20.w),
                                width: 20.w,
                                height: 20.w,
                              ),
                              Text(
                                "Return",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        ),
                        RecordsLineChart(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
