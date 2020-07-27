import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class RangeDataLabel extends StatefulWidget {
  @override
  _RangeDataLabelState createState() => _RangeDataLabelState();
}

class _RangeDataLabelState extends State<RangeDataLabel> {
  int totalStock = 1000;
  int stockOnHand = 500;
  double percentage = 0;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Total Stock On Hand",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15.w,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                value: dropdownValue1,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue1 = newValue;
                  });
                },
                underline: Container(),
                elevation: 6.w,
                items: options1.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.w,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                value: dropdownValue2,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue2 = newValue;
                  });
                },
                underline: Container(),
                elevation: 6.w,
                items: options2.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.w,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
