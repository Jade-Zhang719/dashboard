import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoanPieChart extends StatefulWidget {
  final int shirts;
  final int pants;
  final int jackets;
  final int accessories;

  const LoanPieChart(
      {Key key, this.shirts, this.pants, this.jackets, this.accessories})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoanPieChartState();
}

class _LoanPieChartState extends State<LoanPieChart> {
  int touchedIndex;

  int shirts;
  int pants;
  int jackets;
  int accessories;
  int total;
  @override
  void initState() {
    shirts = widget.shirts;
    pants = widget.pants;
    jackets = widget.jackets;
    accessories = widget.accessories;
    total = shirts + pants + jackets + accessories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                    if (mounted)
                      setState(() {
                        if (pieTouchResponse.touchInput is FlLongPressEnd ||
                            pieTouchResponse.touchInput is FlPanEnd) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      });
                  }),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 10.w,
                  centerSpaceRadius: 80.w,
                  sections: showingSections(),
                ),
                swapAnimationDuration: Duration(milliseconds: 3500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16.w;
      final double radius = isTouched ? 60 : 50.w;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: shirts / total * 100,
            title: '$shirts',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: pants / total * 100,
            title: '$pants',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: jackets / total * 100,
            title: '$jackets',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: accessories / total * 100,
            title: '$accessories',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
