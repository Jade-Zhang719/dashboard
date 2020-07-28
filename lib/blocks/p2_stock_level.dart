import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../items/optionButton.dart';

// ignore: must_be_immutable
class RangeDataLabel extends StatefulWidget {
  @override
  _RangeDataLabelState createState() => _RangeDataLabelState();
}

class _RangeDataLabelState extends State<RangeDataLabel> {
  int totalStock = 1000;
  int stockOnHand = 500;
  double percentage = 0;

  @override
  void initState() {
    percentage = stockOnHand / totalStock * 100;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      margin: EdgeInsets.fromLTRB(0, 20.w, 20.w, 20.w),
      padding: EdgeInsets.only(left: 20.w),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Total Stock On Hand",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15.w,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          OptionButton(
            txSize: 10.w,
          ),
        ],
      ),
    );
  }
}
