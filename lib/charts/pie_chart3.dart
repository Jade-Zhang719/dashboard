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
  DonutPieChart(
      {this.animate, this.shirts, this.pants, this.jackets, this.accessories});

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

    return new charts.PieChart(_createSampleData(),
        animate: animate,
        animationDuration: Duration(milliseconds: 1500),

        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 60.w.toInt(),
            arcRendererDecorators: [new charts.ArcLabelDecorator()]));
  }

  /// Create one series with sample hard coded data.

}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
