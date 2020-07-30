import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordsBarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RecordsBarChartState();
}

class RecordsBarChartState extends State<RecordsBarChart> {
  List<BarChartGroupData> barGroups;

  @override
  void initState() {
    super.initState();
    barGroups = [
      makeGroupData(0, Random().nextDouble() * 20),
      makeGroupData(1, Random().nextDouble() * 20),
      makeGroupData(2, Random().nextDouble() * 20),
      makeGroupData(3, Random().nextDouble() * 20),
      makeGroupData(4, Random().nextDouble() * 20),
      makeGroupData(5, Random().nextDouble() * 20),
      makeGroupData(6, Random().nextDouble() * 20),
      makeGroupData(7, Random().nextDouble() * 20),
      makeGroupData(8, Random().nextDouble() * 20),
      makeGroupData(9, Random().nextDouble() * 20),
      makeGroupData(10, Random().nextDouble() * 20),
      makeGroupData(11, Random().nextDouble() * 20),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isMobile = height > width;
    return Container(
      width: 840.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        color: Theme.of(context).cardColor,
      ),
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 5.w),
      child: BarChart(
        BarChartData(
          maxY: 20,
          minY: 0,
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              textStyle: TextStyle(
                color: Color(0xff7589a2),
                fontSize: isMobile ? 8.w : 14.w,
              ),
              margin: 10.w,
              getTitles: (double value) {
                switch (value.toInt()) {
                  // case 0:
                  //   return '2019-07';
                  case 1:
                    return '2019-08';
                  // case 2:
                  //   return '2019-09';
                  // case 3:
                  //   return '2019-10';
                  case 4:
                    return '2019-11';
                  // case 5:
                  //   return '2019-12';
                  // case 6:
                  //   return '2020-01';
                  case 7:
                    return '2020-02';
                  // case 8:
                  //   return '2020-03';
                  // case 9:
                  //   return '2020-04';
                  case 10:
                    return '2020-05';
                  // case 11:
                  //   return '2020-06';
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(
              showTitles: true,
              textStyle: TextStyle(
                color: Color(0xff7589a2),
                fontSize: 14.w,
              ),
              margin: 15.w,
              reservedSize: 14.w,
              getTitles: (value) {
                if (value == 0) {
                  return '0';
                } else if (value == 10) {
                  return '1K';
                } else if (value == 20) {
                  return '5K';
                } else {
                  return '';
                }
              },
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            checkToShowHorizontalLine: (value) => value % 3 == 0,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey[200],
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey[200],
                strokeWidth: 1,
              );
            },
          ),
          barGroups: barGroups,
        ),
        swapAnimationDuration: Duration(seconds: 1),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      barsSpace: 4.w,
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          color: Colors.blue,
          width: 20.w,
          borderRadius: BorderRadius.circular(2),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            color: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
