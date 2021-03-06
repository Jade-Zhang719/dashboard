import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordsLineChart extends StatefulWidget {
  final int screenType;

  const RecordsLineChart({Key key, this.screenType}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RecordsLineChartState();
}

class _RecordsLineChartState extends State<RecordsLineChart> {
  int screenType;
  Duration duration;
  List<FlSpot> spots1;
  List<FlSpot> spots2;
  @override
  void initState() {
    duration = Duration(milliseconds: 500);
    screenType = widget.screenType;
    spots1 = [
      FlSpot(1, 0),
      FlSpot(2, 0),
      FlSpot(3, 0),
      FlSpot(4, 0),
      FlSpot(5, 0),
      FlSpot(6, 0),
      FlSpot(7, 0),
      FlSpot(8, 0),
      FlSpot(9, 0),
      FlSpot(10, 0),
    ];
    spots2 = [
      FlSpot(1, 0),
      FlSpot(2, 0),
      FlSpot(3, 0),
      FlSpot(4, 0),
      FlSpot(5, 0),
      FlSpot(6, 0),
      FlSpot(7, 0),
      FlSpot(8, 0),
      FlSpot(9, 0),
      FlSpot(10, 0),
    ];

    _changeSpots();
    super.initState();
  }

  Future<void> _changeSpots() async {
    await Future.delayed(new Duration(milliseconds: 1));
    setState(() {
      duration = Duration(milliseconds: 500);
      spots1 = [
        FlSpot(1, Random().nextDouble() * 50),
        FlSpot(2, Random().nextDouble() * 50),
        FlSpot(3, Random().nextDouble() * 50),
        FlSpot(4, Random().nextDouble() * 50),
        FlSpot(5, Random().nextDouble() * 50),
        FlSpot(6, Random().nextDouble() * 50),
        FlSpot(7, Random().nextDouble() * 50),
        FlSpot(8, Random().nextDouble() * 50),
        FlSpot(9, Random().nextDouble() * 50),
        FlSpot(10, Random().nextDouble() * 50),
      ];
      spots2 = [
        FlSpot(1, Random().nextDouble() * 50),
        FlSpot(2, Random().nextDouble() * 50),
        FlSpot(3, Random().nextDouble() * 50),
        FlSpot(4, Random().nextDouble() * 50),
        FlSpot(5, Random().nextDouble() * 50),
        FlSpot(6, Random().nextDouble() * 50),
        FlSpot(7, Random().nextDouble() * 50),
        FlSpot(8, Random().nextDouble() * 50),
        FlSpot(9, Random().nextDouble() * 50),
        FlSpot(10, Random().nextDouble() * 50),
      ];
    });
  }

  @override
  void didUpdateWidget(RecordsLineChart oldWidget) {
    duration = Duration(seconds: 0);
    screenType = widget.screenType;
    spots1 = [
      FlSpot(1, 0),
      FlSpot(2, 0),
      FlSpot(3, 0),
      FlSpot(4, 0),
      FlSpot(5, 0),
      FlSpot(6, 0),
      FlSpot(7, 0),
      FlSpot(8, 0),
      FlSpot(9, 0),
      FlSpot(10, 0),
    ];
    spots2 = [
      FlSpot(1, 0),
      FlSpot(2, 0),
      FlSpot(3, 0),
      FlSpot(4, 0),
      FlSpot(5, 0),
      FlSpot(6, 0),
      FlSpot(7, 0),
      FlSpot(8, 0),
      FlSpot(9, 0),
      FlSpot(10, 0),
    ];

    _changeSpots();

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: AspectRatio(
        aspectRatio: screenType == 1 ? 3.5 : 2.5,
        child: LineChart(
          sampleData(),
          swapAnimationDuration: duration,
        ),
      ),
    );
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
          textStyle: Theme.of(context).textTheme.bodyText2,
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
          textStyle: Theme.of(context).textTheme.bodyText2,
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
        spots: spots1,
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
        spots: spots2,
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
}
