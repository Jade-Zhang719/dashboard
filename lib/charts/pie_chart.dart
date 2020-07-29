import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StockPieChart extends StatefulWidget {
  final double value;

  const StockPieChart({Key key, this.value}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StockPieChartState();
}

class _StockPieChartState extends State<StockPieChart> {
  double value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(StockPieChart oldWidget) {
    value = widget.value;

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.w,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          startDegreeOffset: -90,
          centerSpaceRadius: 20.w,
          sections: showingSections(value),
        ),
        swapAnimationDuration: Duration(seconds: 1),
      ),
    );
  }

  List<PieChartSectionData> showingSections(double value) {
    return List.generate(2, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            showTitle: false,
            color: Colors.blue,
            value: value,
            radius: 10.w,
          );
        case 1:
          return PieChartSectionData(
            showTitle: false,
            color: Colors.transparent,
            value: 100 - value,
            radius: 10.w,
          );
        default:
          return null;
      }
    });
  }
}
