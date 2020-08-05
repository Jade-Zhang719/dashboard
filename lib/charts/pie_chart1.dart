import 'package:charts_flutter/flutter.dart' as charts;
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
    List<charts.Series<LinearSales, int>> _createSampleData() {
      final data = [
        new LinearSales(0, value),
        new LinearSales(1, 100 - value),
      ];

      return [
        new charts.Series<LinearSales, int>(
          id: 'Stock',
          domainFn: (LinearSales sales, _) => sales.index,
          measureFn: (LinearSales sales, _) => sales.stock,
          data: data,
          colorFn: (LinearSales segment, _) {
            switch (segment.index) {
              case 0:
                {
                  return charts.ColorUtil.fromDartColor(Colors.blue);
                }

              case 1:
                {
                  return charts.ColorUtil.fromDartColor(Colors.transparent);
                }

              default:
                {
                  return charts.ColorUtil.fromDartColor(Colors.transparent);
                }
            }
          },
        )
      ];
    }

    return new charts.PieChart(
      _createSampleData(),
      animate: true,
      animationDuration: Duration(milliseconds: 500),
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 10.w.toInt(),
      ),
    );
  }
}

class LinearSales {
  final int index;
  final double stock;

  LinearSales(this.index, this.stock);
}
