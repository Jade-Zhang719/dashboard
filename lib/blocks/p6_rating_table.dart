import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingTable extends StatefulWidget {
  final isDark;

  const RatingTable({Key key, this.isDark}) : super(key: key);
  @override
  _RatingTableState createState() => _RatingTableState();
}

class _RatingTableState extends State<RatingTable> {
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
  void didUpdateWidget(RatingTable oldWidget) {
    setState(() {
      isDark = widget.isDark;
    });

    super.didUpdateWidget(oldWidget);
  }

  TableRow _tableRowBuilder(String index, String id, String qty, String date,
      String time, int type, bool isDark) {
    Color bgColor;
    Color txColor;
    if (isDark) {
      if (type == 1) {
        bgColor = Theme.of(context).primaryColor;
        txColor = Colors.white;
      } else {
        bgColor = Colors.indigo[900];
        txColor = Colors.white;
      }
    } else {
      if (type == 1) {
        bgColor = Colors.white;
        txColor = Colors.black;
      } else {
        bgColor = Colors.blueAccent;
        txColor = Colors.white;
      }
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
      height: 230.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: (isDark) ? Theme.of(context).primaryColor : Colors.white,
      ),
      child: Table(
        border: TableBorder.symmetric(inside: BorderSide(color: Colors.grey)),
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(2),
        },
        children: [
          TableRow(
              decoration: BoxDecoration(
                  color:
                      (isDark) ? Theme.of(context).primaryColor : Colors.white),
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      "#",
                      style: TextStyle(
                          color: (isDark) ? Colors.white : Colors.black,
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
                          color: (isDark) ? Colors.white : Colors.black,
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
                          color: (isDark) ? Colors.white : Colors.black,
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
                          color: (isDark) ? Colors.white : Colors.black,
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
                          color: (isDark) ? Colors.white : Colors.black,
                          fontSize: 10.w,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
          _tableRowBuilder(
              "1", "100000086", "$shirts", "2020/3/3", "10:30", 2, isDark),
          _tableRowBuilder(
              "2", "100000086", "$pants", "2020/3/3", "10:30", 1, isDark),
          _tableRowBuilder(
              "3", "100000086", "$jackets", "2020/3/3", "10:30", 2, isDark),
          _tableRowBuilder(
              "4", "100000086", "$pants", "2020/3/3", "10:30", 1, isDark),
        ],
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      ),
    );
  }
}
