import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speedometer_chart/speedometer_chart.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

const double step = 10.0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: JoystickSpeedometerExample(),
      ),
    );
  }
}

class JoystickSpeedometerExample extends StatefulWidget {
  const JoystickSpeedometerExample({Key? key}) : super(key: key);

  @override
  _JoystickSpeedometerExampleState createState() =>
      _JoystickSpeedometerExampleState();
}

class _JoystickSpeedometerExampleState
    extends State<JoystickSpeedometerExample> {
  double _x = 0;
  double _y = 0;
  double _speed = 0.0;
  double _leverValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Speedometer(speed: _speed),
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 16.0),
                  Container(
                    width: 40,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LeverButton(
                          icon: Icons.arrow_upward,
                          onPressed: () {
                            _updateLeverValue(1.0);
                          },
                        ),
                        LeverButton(
                          icon: Icons.arrow_downward,
                          onPressed: () {
                            _updateLeverValue(-1.0);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Joystick(
                      listener: (details) {
                        setState(() {
                          _x = _x + step * details.x;
                          _y = _y + step * details.y;
                          _speed = sqrt(pow(details.x, 2) + pow(details.y, 2));
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateLeverValue(double value) {
    setState(() {
      _leverValue = value;
    });
  }
}

class LeverButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const LeverButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}

class Speedometer extends StatelessWidget {
  final double speed;

  const Speedometer({Key? key, required this.speed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 100,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 40,
                  color: Colors.red,
                ),
                GaugeRange(
                  startValue: 40,
                  endValue: 70,
                  color: Colors.yellow,
                ),
                GaugeRange(
                  startValue: 70,
                  endValue: 100,
                  color: Colors.green,
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: (speed * 100),
                  enableAnimation: true,
                  animationDuration: 1000,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    'Speed',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  positionFactor: 0.1,
                  angle: 90,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
