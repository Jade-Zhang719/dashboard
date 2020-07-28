import 'package:flutter/material.dart';

class OptionButton extends StatefulWidget {
  final double txSize;

  const OptionButton({Key key, this.txSize}) : super(key: key);

  @override
  _OptionButtonState createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  double txSize;
  String dropdownValue1 = "Option 1";
  List<String> options1 = [
    "Option 1",
  ];
  String dropdownValue2 = "Option 2";
  List<String> options2 = [
    "Option 2",
  ];

  @override
  void initState() {
    txSize = widget.txSize;
    super.initState();
  }

  @override
  void didUpdateWidget(OptionButton oldWidget) {
    txSize = widget.txSize;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: txSize * 3,
            child: DropdownButton<String>(
              iconSize: txSize * 2,
              dropdownColor: Colors.white,
              value: dropdownValue1,
              style: TextStyle(
                color: Colors.black,
                fontSize: txSize,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue1 = newValue;
                });
              },
              underline: Container(),
              elevation: 6,
              items: options1.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: txSize,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            height: txSize * 3,
            child: DropdownButton<String>(
              iconSize: txSize * 2,
              dropdownColor: Colors.white,
              value: dropdownValue2,
              style: TextStyle(
                color: Colors.black,
                fontSize: txSize,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue2 = newValue;
                });
              },
              underline: Container(),
              elevation: 6,
              items: options2.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: txSize,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
