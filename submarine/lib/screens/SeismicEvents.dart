import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class SeismicEventsChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const magnitudes = [3, 4, 5, 6, 7, 8, 9];
    const categories = ['Minor', 'Light', 'Moderate', 'Strong', 'Major', 'Great', 'Catastrophic'];
    const data = [2, 4, 5, 6, 7, 8, 9]; // Example seismic event data

    return Scaffold(
      appBar: AppBar(
        title: Text('Seismic Events Radar Chart'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: RadarChart.light(
            ticks: magnitudes,
            features: categories,
            data: [data],
            reverseAxis: true,

          ),
        ),
      ),
    );
  }

}