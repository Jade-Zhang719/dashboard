import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  List<FlSpot> spots;
  Duration duration;
  @override
  void initState() {
    duration = Duration(milliseconds: 500);
    spots = [
      FlSpot(1, 0),
      FlSpot(2, 0),
      FlSpot(3, 0),
      FlSpot(5, 0),
      FlSpot(7, 0),
      FlSpot(8, 0),
      FlSpot(10, 0),
    ];
    super.initState();
    _changeSpots();
  }

  Future<void> _changeSpots() async {
    await Future.delayed(new Duration(milliseconds: 1));
    setState(() {
      duration = Duration(milliseconds: 500);
      spots = [
        FlSpot(1, Random().nextDouble() * 5),
        FlSpot(2, Random().nextDouble() * 5),
        FlSpot(3, Random().nextDouble() * 5),
        FlSpot(5, Random().nextDouble() * 5),
        FlSpot(7, Random().nextDouble() * 5),
        FlSpot(8, Random().nextDouble() * 5),
        FlSpot(10, Random().nextDouble() * 5),
      ];
    });
  }

  @override
  void didUpdateWidget(LineChartSample2 oldWidget) {
    duration = Duration(seconds: 0);
    spots = [
      FlSpot(1, 0),
      FlSpot(2, 0),
      FlSpot(3, 0),
      FlSpot(5, 0),
      FlSpot(7, 0),
      FlSpot(8, 0),
      FlSpot(10, 0),
    ];
    _changeSpots();
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
        color: Colors.transparent,
      ),
      padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 0),
      child: LineChart(
        mainDataLight(),
        swapAnimationDuration: duration,
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
          textStyle: Theme.of(context).textTheme.bodyText2,
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
          textStyle: Theme.of(context).textTheme.bodyText2,
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
          spots: spots,
          isCurved: false,
          colors: gradientColors,
          barWidth: 2,
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
}
