import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordsLineChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecordsLineChartState();
}

class _RecordsLineChartState extends State<RecordsLineChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: 650.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(20.w),
      child: LineChart(
        sampleData(),
        swapAnimationDuration: Duration(milliseconds: 250),
      ),
    );
  }
}

LineChartData sampleData() {
  return LineChartData(
    lineTouchData: LineTouchData(
      enabled: false,
    ),
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      checkToShowHorizontalLine: (value) => value % 10 == 0,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey[400],
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.grey[400],
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 15.w,
        textStyle: TextStyle(
          color: Colors.blueGrey,
          fontSize: 12.w,
        ),
        margin: 10.w,
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '07-01';
            case 2:
              return '07-02';
            case 3:
              return '07-03';
            case 4:
              return '07-04';
            case 5:
              return '07-05';
            case 6:
              return '07-06';
            case 7:
              return '07-07';
            case 8:
              return '07-08';
            case 9:
              return '07-09';
            case 10:
              return '07-10';
          }
          return '';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        reservedSize: 20.w,
        textStyle: TextStyle(
          color: Colors.blueGrey,
          fontSize: 12.w,
        ),
        margin: 10.w,
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '0';
            case 10:
              return '1k';
            case 20:
              return '2k';
            case 30:
              return '3k';
            case 40:
              return '4k';
            case 50:
              return '5k';
          }
          return '';
        },
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border(
        bottom: BorderSide(
          color: Colors.blueGrey,
          width: 4.w,
        ),
        left: BorderSide(
          color: Colors.transparent,
        ),
        right: BorderSide(
          color: Colors.transparent,
        ),
        top: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    minX: 0,
    maxX: 11,
    maxY: 50,
    minY: 0,
    lineBarsData: linesBarData(),
  );
}

List<LineChartBarData> linesBarData() {
  return [
    LineChartBarData(
      spots: [
        FlSpot(1, 42),
        FlSpot(2, 31),
        FlSpot(3, 14),
        FlSpot(4, 18),
        FlSpot(5, 10),
        FlSpot(6, 20),
        FlSpot(7, 35),
        FlSpot(8, 22),
        FlSpot(9, 40),
        FlSpot(10, 50),
      ],
      isCurved: true,
      curveSmoothness: 0,
      colors: [
        Colors.blue,
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(
        show: true,
        colors: [
          Color(0x4427b6fc),
        ],
      ),
    ),
    LineChartBarData(
      spots: [
        FlSpot(1, 10),
        FlSpot(2, 40),
        FlSpot(3, 18),
        FlSpot(4, 50),
        FlSpot(5, 20),
        FlSpot(6, 22),
        FlSpot(7, 35),
        FlSpot(8, 42),
        FlSpot(9, 31),
        FlSpot(10, 14),
      ],
      isCurved: true,
      curveSmoothness: 0,
      colors: [
        Colors.green,
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(
        show: true,
        colors: [
          Color(0x444af699),
        ],
      ),
    ),
  ];
}
