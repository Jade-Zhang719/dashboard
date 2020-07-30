import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartSample2 extends StatefulWidget {
  final isDark;

  const LineChartSample2({Key key, this.isDark}) : super(key: key);
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  bool isDark;
  @override
  void initState() {
    isDark = widget.isDark;
    super.initState();
  }

  @override
  void didUpdateWidget(LineChartSample2 oldWidget) {
    isDark = widget.isDark;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: 180.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: (isDark) ? Color(0xff232d37) : Colors.transparent,
      ),
      padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 0),
      child: LineChart(
        (isDark) ? mainDataDark() : mainDataLight(),
        swapAnimationDuration: Duration(seconds: 1),
      ),
    );
  }

  LineChartData mainDataLight() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        checkToShowHorizontalLine: (value) => value % 2 == 0,
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
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 12.w,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '07-01';

              case 4:
                return '07-04';

              case 7:
                return '07-07';

              case 10:
                return '07-10';
            }
            return '';
          },
          margin: 5.w,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          reservedSize: 15.w,
          textStyle: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 8.w,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1k';
              case 3:
                return '3k';
              case 5:
                return '5k';
            }
            return '';
          },
          margin: 5.w,
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
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, Random().nextDouble() * 5),
            FlSpot(2, Random().nextDouble() * 5),
            FlSpot(3, Random().nextDouble() * 5),
            FlSpot(5, Random().nextDouble() * 5),
            FlSpot(7, Random().nextDouble() * 5),
            FlSpot(8, Random().nextDouble() * 5),
            FlSpot(10, Random().nextDouble() * 5),
          ],
          isCurved: false,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.7)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData mainDataDark() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        checkToShowHorizontalLine: (value) => value % 2 == 0,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: Color(0xff68737d),
            fontSize: 12.w,
            fontWeight: FontWeight.bold,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '07-01';

              case 4:
                return '07-04';

              case 7:
                return '07-07';

              case 10:
                return '07-10';
            }
            return '';
          },
          margin: 5.w,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          reservedSize: 15.w,
          textStyle: TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 8.w,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1k';
              case 3:
                return '3k';
              case 5:
                return '5k';
            }
            return '';
          },
          margin: 5.w,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: const Color(0xff37434d),
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
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, Random().nextDouble() * 5),
            FlSpot(2, Random().nextDouble() * 5),
            FlSpot(3, Random().nextDouble() * 5),
            FlSpot(5, Random().nextDouble() * 5),
            FlSpot(7, Random().nextDouble() * 5),
            FlSpot(8, Random().nextDouble() * 5),
            FlSpot(10, Random().nextDouble() * 5),
          ],
          isCurved: false,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
