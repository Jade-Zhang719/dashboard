import '../charts/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastTenRecords extends StatefulWidget {
  @override
  _LastTenRecordsState createState() => _LastTenRecordsState();
}

class _LastTenRecordsState extends State<LastTenRecords> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Total Status",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20.w,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Loan: 123",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20.w,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Return: 123",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20.w,
                  ),
                ),
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
