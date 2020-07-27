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
      makeGroupData(0, 5),
      makeGroupData(1, 16),
      makeGroupData(2, 18),
      makeGroupData(3, 20),
      makeGroupData(4, 17),
      makeGroupData(5, 19),
      makeGroupData(6, 12),
      makeGroupData(7, 18),
      makeGroupData(8, 6),
      makeGroupData(9, 3),
      makeGroupData(10, 15),
      makeGroupData(11, 9),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 840.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(25.w, 20.w, 20.w, 10.w),
      child: BarChart(
        BarChartData(
          maxY: 20,
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              textStyle: TextStyle(
                  color: const Color(0xff7589a2),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              margin: 20,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return '2019-07';
                  case 1:
                    return '2019-08';
                  case 2:
                    return '2019-09';
                  case 3:
                    return '2019-10';
                  case 4:
                    return '2019-11';
                  case 5:
                    return '2019-12';
                  case 6:
                    return '2020-01';
                  case 7:
                    return '2020-02';
                  case 8:
                    return '2020-03';
                  case 9:
                    return '2020-04';
                  case 10:
                    return '2020-05';
                  case 11:
                    return '2020-06';
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(
              showTitles: true,
              textStyle: TextStyle(
                  color: const Color(0xff7589a2),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              margin: 32,
              reservedSize: 14,
              getTitles: (value) {
                if (value == 0) {
                  return '1K';
                } else if (value == 10) {
                  return '5K';
                } else if (value == 19) {
                  return '10K';
                } else {
                  return '';
                }
              },
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: barGroups,
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y,
        color: Colors.blue,
        width: 40.w,
        borderRadius: BorderRadius.circular(2),
      ),
    ]);
  }
}
