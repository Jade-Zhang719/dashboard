import '../charts/line_chart2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastTenDetails extends StatefulWidget {
  @override
  _LastTenDetailsState createState() => _LastTenDetailsState();
}

class _LastTenDetailsState extends State<LastTenDetails> {
  @override
  Widget build(BuildContext context) {
    Container _stockCard(String variety) {
      return Container(
        width: 360.w,
        height: 85.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      variety,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.w,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Loan by last 10 days",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10.w,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      "2435",
                      style: TextStyle(
                          color: Color(0xff2F4860),
                          fontSize: 20.w,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            LineChartSample2(),
          ],
        ),
      );
    }

    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _stockCard("T-shirt"),
          _stockCard("Trousers"),
          _stockCard("Jacket"),
          _stockCard("Accessories"),
        ],
      ),
    );
  }
}
