import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

class GaugeForStockLevel extends StatefulWidget {
  final percentage;
  final isDark;
  const GaugeForStockLevel({Key key, this.percentage, this.isDark})
      : super(key: key);
  @override
  _GaugeForStockLevelState createState() => _GaugeForStockLevelState();
}

class _GaugeForStockLevelState extends State<GaugeForStockLevel> {
  double percentage;
  bool isDark;
  GlobalKey<KdGaugeViewState> key = GlobalKey<KdGaugeViewState>();
  @override
  void initState() {
    percentage = widget.percentage;
    isDark = widget.isDark;

    super.initState();
  }

  @override
  void didUpdateWidget(GaugeForStockLevel oldWidget) {
    setState(() {
      percentage = widget.percentage;
      isDark = widget.isDark;
    });
    key.currentState.updateSpeed(0);
    key.currentState
        .updateSpeed(percentage, animate: true, duration: Duration(seconds: 1));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return KdGaugeView(
      key: key,
      innerCirclePadding: 10.w,
      unitOfMeasurement: "Stock Level (%)",
      unitOfMeasurementTextStyle: Theme.of(context).textTheme.bodyText2,
      minMaxTextStyle: Theme.of(context).textTheme.bodyText2,
      speedTextStyle: Theme.of(context).textTheme.headline1,
      minSpeed: 0,
      maxSpeed: 100,
      speed: percentage,
      animate: true,
      alertSpeedArray: [0, 30, 70],
      alertColorArray: [Colors.red, Colors.yellow, Colors.green],
      duration: Duration(seconds: 1),
    );
  }
}
