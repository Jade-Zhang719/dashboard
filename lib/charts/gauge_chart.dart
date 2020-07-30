import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

class GaugeForStockLevel extends StatefulWidget {
  final percentage;

  const GaugeForStockLevel({Key key, this.percentage}) : super(key: key);
  @override
  _GaugeForStockLevelState createState() => _GaugeForStockLevelState();
}

class _GaugeForStockLevelState extends State<GaugeForStockLevel> {
  double percentage;
  @override
  void initState() {
    percentage = widget.percentage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KdGaugeView(
      innerCirclePadding: 10.w,
      unitOfMeasurement: "Stock Level (%)",
      unitOfMeasurementTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 5.w),
      minMaxTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 5.w),
      speedTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.w),
      minSpeed: 0,
      maxSpeed: 100,
      speed: percentage,
      animate: true,
      alertSpeedArray: [40, 80, 100],
      alertColorArray: [Colors.orange, Colors.indigo, Colors.red],
      duration: Duration(seconds: 1),
    );
  }
}
