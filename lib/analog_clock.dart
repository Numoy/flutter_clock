import 'dart:async';

import 'package:analog_clock/clock_animation.dart';
import 'package:analog_clock/symbols.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final radiansPerTick = radians(360 / 60);
final radiansPerHour = radians(360 / 12);

class AnalogClock extends StatefulWidget {
  const AnalogClock(this.model);

  final ClockModel model;

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  Timer _timer;
  List<String> _oldTime;
  List<String> _time;
  int columns = 12 * 2;

  List<Widget> clocks = [];

  @override
  void initState() {
    super.initState();
    _time = createClockString(DateTime.now());
    _oldTime = _time;
    clocks = getRowOfClocks(_time, _oldTime);
    _timer = Timer.periodic(Duration(minutes: 1), (Timer t) {
      _updateTime();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    this.setState(() {
      var now = DateTime.now();
      _oldTime = _time;
      _time = createClockString(now);
      clocks = getRowOfClocks(_time, _oldTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 500,
      height: 300,
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: clocks,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getRowOfClocks(var _time, var _oldTime) {
    List<Widget> widgets = [];
    for (int i = 0; i < 12; i++) {
      widgets.add(_rowOfClocks(_time.elementAt(i), _oldTime.elementAt(i)));
    }

    return widgets;
  }

  Widget _rowOfClocks(String times, String oldTimes) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getClockWidgets(times, oldTimes));
  }

  List<Widget> getClockWidgets(var times, var oldTimes) {
    List<Widget> widgets = [];
    for (int i = 0; i < 24; i++) {
      widgets.add(
        Container(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClockWidget(
              angleHourStart: symbolMap[oldTimes[i]].elementAt(0),
              angleHourEnd: symbolMap[times[i]].elementAt(1),
              angleMinuteStart: symbolMap[oldTimes[i]].elementAt(1),
              angleMinuteEnd: symbolMap[times[i]].elementAt(0),
            ),
          ),
          
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),border: Border.all(color: Colors.white54,style: BorderStyle.solid)),
        ),
      );
    }
    return widgets;
  }

  List<String> createClockString(DateTime dateTime) {
    String minute = dateTime.minute < 10
        ? "0" + "${dateTime.minute.toString()}"
        : dateTime.minute.toString();
    String hour = dateTime.hour < 10
        ? "0" + "${dateTime.hour.toString()}"
        : dateTime.hour.toString();

    int firstMinuteSymbol = int.parse(minute[0]);
    int secondMinuteSymbol = int.parse(minute[1]);

    int firstHourSymbol = int.parse(hour[0]);
    int secondHourSymbol = int.parse(hour[1]);

    List<String> values = [];

    values.add(digitSymbol['top'].elementAt(0));
    values.add(digitSymbol['line'].elementAt(0));
    values.add(digitSymbol['line'].elementAt(0));
    for (int i = 0; i < 6; i++) {
      values.add(digitSymbol['start'].elementAt(i) +
          digitSymbol[firstHourSymbol].elementAt(i) +
          digitSymbol[secondHourSymbol].elementAt(i) +
          digitSymbol[':'].elementAt(i) +
          digitSymbol[firstMinuteSymbol].elementAt(i) +
          digitSymbol[secondMinuteSymbol].elementAt(i) +
          digitSymbol['end'].elementAt(i));
    }
    values.add(digitSymbol['line'].elementAt(0));
    values.add(digitSymbol['line'].elementAt(0));
    values.add(digitSymbol['bottom'].elementAt(1));
    for (var value in values) {
      print(value);
    }
    return values;
  }
}
