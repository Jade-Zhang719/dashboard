import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int totalStock = 1000;
int stockOnHand = 500;
double percentage = 0;
String dropdownValue1 = "Option 1";
List<String> options1 = [
  "Option 1",
];
String dropdownValue2 = "Option 2";
List<String> options2 = [
  "Option 2",
];
SfRadialGauge getRangeDataLabelExample() {
  return SfRadialGauge(
    animationDuration: 3500,
    enableLoadingAnimation: true,
    axes: <RadialAxis>[
      RadialAxis(
        showTicks: true,
        startAngle: 180,
        endAngle: 0,
        showAxisLine: false,
        showLastLabel: true,
        needsRotateLabels: true,
        axisLabelStyle: GaugeTextStyle(
          fontSize: 6.w,
        ),
        minimum: 0,
        maximum: 99,
        tickOffset: 1.w,
        radiusFactor: kIsWeb ? 0.8 : 0.9,
        labelOffset: 5.w,
        showLabels: true,
        labelsPosition: ElementsPosition.inside,
        majorTickStyle: MajorTickStyle(
          length: 0.15,
          lengthUnit: GaugeSizeUnit.factor,
          thickness: 1,
        ),
        minorTicksPerInterval: 4,
        interval: 10,
        minorTickStyle: MinorTickStyle(
          length: 0.06,
          thickness: 1,
          lengthUnit: GaugeSizeUnit.factor,
        ),
        ranges: <GaugeRange>[
          GaugeRange(
            startValue: 0,
            endValue: 33,
            color: const Color(0xFFFE2A25),
            label: 'Low'.toUpperCase(),
            sizeUnit: GaugeSizeUnit.factor,
            labelStyle: GaugeTextStyle(fontSize: 6.w),
            startWidth: 0.25,
            endWidth: 0.25,
          ),
          GaugeRange(
            startValue: 33,
            endValue: 66,
            color: const Color(0xFFFFBA00),
            label: 'Middle'.toUpperCase(),
            sizeUnit: GaugeSizeUnit.factor,
            labelStyle: GaugeTextStyle(fontSize: 6.w),
            startWidth: 0.25,
            endWidth: 0.25,
          ),
          GaugeRange(
            startValue: 66,
            endValue: 99,
            color: const Color(0xFF00AB47),
            label: 'High'.toUpperCase(),
            sizeUnit: GaugeSizeUnit.factor,
            labelStyle: GaugeTextStyle(fontSize: 6.w),
            startWidth: 0.25,
            endWidth: 0.25,
          ),
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              angle: 90,
              positionFactor: 0.25,
              widget: Container(
                child: Text(
                  'Stock Level: ${percentage.toString()}%  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.w),
                ),
              ))
        ],
        pointers: <GaugePointer>[
          NeedlePointer(
            value: stockOnHand / totalStock * 100,
            needleLength: 0.45,
            lengthUnit: GaugeSizeUnit.factor,
            needleStartWidth: 1.w,
            needleEndWidth: 5.w,
            enableAnimation: true,
            animationDuration: 800,
            animationType: AnimationType.ease,
            knobStyle: KnobStyle(
              knobRadius: 7.w,
              sizeUnit: GaugeSizeUnit.logicalPixel,
            ),
          ),
        ],
      )
    ],
  );
}
