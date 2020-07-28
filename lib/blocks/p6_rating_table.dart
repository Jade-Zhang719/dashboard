import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingTable extends StatefulWidget {
  @override
  _RatingTableState createState() => _RatingTableState();
}

class _RatingTableState extends State<RatingTable> {
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

  TableRow _tableRowBuilder(
    String index,
    String id,
    String qty,
    String date,
    String time,
    int type,
  ) {
    Color bgColor;
    Color txColor;
    if (type == 1) {
      bgColor = Colors.white;
      txColor = Colors.black;
    } else {
      bgColor = Colors.blueAccent;
      txColor = Colors.white;
    }
    return TableRow(
      decoration: BoxDecoration(color: bgColor),
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: Text(
              index,
              style: TextStyle(color: txColor, fontSize: 10.w),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: Text(
              id,
              style: TextStyle(color: txColor, fontSize: 10.w),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: Text(
              qty,
              style: TextStyle(color: txColor, fontSize: 10.w),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: Text(
              date,
              style: TextStyle(color: txColor, fontSize: 10.w),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: Text(
              time,
              style: TextStyle(color: txColor, fontSize: 10.w),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450.w,
      height: 250.w,
      alignment: Alignment.centerLeft,
      child: Table(
        border: TableBorder.symmetric(inside: BorderSide(color: Colors.grey)),
        columnWidths: {
          0: FixedColumnWidth(40.w),
          1: FixedColumnWidth(100.w),
          2: FixedColumnWidth(100.w),
          3: FixedColumnWidth(100.w),
          4: FixedColumnWidth(100.w),
        },
        children: [
          TableRow(children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  "#",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.w,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  "Uniform ID".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.w,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  "Qty".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.w,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  "Date".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.w,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  "Time".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.w,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
          _tableRowBuilder(
            "1",
            "100000086",
            "$shirts",
            "2020/3/3",
            "10:30",
            2,
          ),
          _tableRowBuilder(
            "2",
            "100000086",
            "$pants",
            "2020/3/3",
            "10:30",
            1,
          ),
          _tableRowBuilder(
            "3",
            "100000086",
            "$jackets",
            "2020/3/3",
            "10:30",
            2,
          ),
          _tableRowBuilder(
            "4",
            "100000086",
            "$pants",
            "2020/3/3",
            "10:30",
            1,
          ),
        ],
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      ),
    );
  }
}
