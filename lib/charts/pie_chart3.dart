/// Donut chart example. This is a simple pie chart with a hole in the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonutPieChart extends StatelessWidget {
  final bool animate;
  final int shirts;
  final int pants;
  final int jackets;
  final int accessories;
  final isDark;
  DonutPieChart(
      {this.animate,
      this.shirts,
      this.pants,
      this.jackets,
      this.accessories,
      this.isDark});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<LinearSales, int>> _createSampleData() {
      final data = [
        new LinearSales(0, shirts),
        new LinearSales(1, pants),
        new LinearSales(2, jackets),
        new LinearSales(3, accessories),
      ];

      return [
        new charts.Series<LinearSales, int>(
            id: 'Sales',
            domainFn: (LinearSales sales, _) => sales.year,
            measureFn: (LinearSales sales, _) => sales.sales,
            data: data,
            labelAccessorFn: (LinearSales row, _) => '${row.sales}',
            colorFn: (LinearSales segment, _) {
              switch (segment.year) {
                case 0:
                  {
                    return charts.ColorUtil.fromDartColor(Color(0xff0293ee));
                  }

                case 1:
                  {
                    return charts.ColorUtil.fromDartColor(Color(0xfff8b250));
                  }

                case 2:
                  {
                    return charts.ColorUtil.fromDartColor(Color(0xff845bef));
                  }

                case 3:
                  {
                    return charts.ColorUtil.fromDartColor(Color(0xff13d38e));
                  }

                default:
                  {
                    return charts.ColorUtil.fromDartColor(Color(0xff0293ee));
                  }
              }
            })
      ];
    }

    return new charts.PieChart(
      _createSampleData(),
      animate: animate,
      animationDuration: Duration(milliseconds: 500),
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 35.w.toInt(),
        arcRendererDecorators: [
          new charts.ArcLabelDecorator(
            insideLabelStyleSpec: new charts.TextStyleSpec(
              color: charts.Color.white,
              fontSize: 12.w.toInt(),
            ),
            outsideLabelStyleSpec: new charts.TextStyleSpec(
              color: (isDark) ? charts.Color.white : charts.Color.black,
              fontSize: 12.w.toInt(),
            ),
          ),
        ],
      ),
    );
  }

  /// Create one series with sample hard coded data.

}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
