import 'package:analog_clock/drawn_hand.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClockWidget extends StatefulWidget {
  final double angleHourStart;
  final double angleMinuteStart;

  final double angleHourEnd;
  final double angleMinuteEnd;

  ClockWidget(
      {this.angleHourStart,
      this.angleHourEnd,
      this.angleMinuteStart,
      this.angleMinuteEnd});

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget>
    with TickerProviderStateMixin {
  Animation<double> _animationHour;
  Tween<double> _tweenHour;
  AnimationController _animationControllerHour;

  Animation<double> _animationMinute;
  Tween<double> _tweenMinute;
  AnimationController _animationControllerMinute;

  @override
  void initState() {
    
    super.initState();
    _animationControllerHour =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _tweenHour = Tween(begin: widget.angleHourStart, end: widget.angleHourEnd);
    _animationHour = _tweenHour.animate(_animationControllerHour)
      ..addListener(() {
        setState(() {});
      });
    _animationControllerMinute =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _tweenMinute =
        Tween(begin: widget.angleMinuteStart, end: widget.angleMinuteEnd);
    _animationMinute = _tweenMinute.animate(_animationControllerMinute)
      ..addListener(() {
        setState(() {});
      });

      _animationControllerHour.forward();
      _animationControllerMinute.forward();
  }

  void setNewPosition({double angleHour, double angleMinute}) {
    _tweenHour.begin = _tweenHour.end;
      _animationControllerHour.reset();
      _tweenHour.end = angleHour;
      _animationControllerHour.forward();

      _tweenMinute.begin = _tweenMinute.end;
      _animationControllerMinute.reset();
      _tweenMinute.end = angleMinute;
      _animationControllerMinute.forward();
  }

  @override
  void dispose() {
    _animationControllerHour.dispose();
    _animationControllerMinute.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hourValue = _animationHour.value;
    final minuteValue = _animationMinute.value;
    return Container(
      child: Stack(
        children: [
          DrawnHand(
            color: Colors.white,
            thickness: 2,
            size: 1,
            angleRadians: hourValue,
          ),
          DrawnHand(
            color: Colors.white,
            thickness: 2,
            size: 1,
            angleRadians: minuteValue,
          ),
        ],
      ),
    );
  }
}
