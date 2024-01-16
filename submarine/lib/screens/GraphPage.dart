import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          // Add the FloatingActionButton to the AppBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                // Your logic for the floating button press
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Download Data')),
                );
              },
              child: Icon(Icons.download),
            ),
          ),
        ],
      ),
      body: GridPageContent(),

    );
  }
}
class GridPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: PHIndicatorItem(),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: EmissionTrackingItem(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: SalinityStatsItem(),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: CommunicationStatsItem(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Add the FloatingActionButton here

        ],
      ),
    );
  }
}



class PHIndicatorItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: PHIndicator(),
      ),
    );
  }
}

class PHIndicator extends StatelessWidget {
  final double phValue = 2.3; // Example pH value

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Display the pH indicator on the left side (smaller size)
        Container(
          width: 300, // Adjust the width as needed
          child: SfLinearGauge(
            orientation: LinearGaugeOrientation.vertical,
            minimum: 0,
            maximum: 14,

            axisTrackStyle: const LinearAxisTrackStyle(
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 10, // Adjust the thickness as needed
              borderColor: Colors.grey,

            ),
            axisLabelStyle: const TextStyle(
              fontSize: 8, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
              color: Colors.black,

            ),
            ranges: [
              LinearGaugeRange(
                startValue: 0,
                endValue: 3,
                color: Colors.red,
              ),
              LinearGaugeRange(
                startValue: 3,
                endValue: 6,
                color: Colors.orange,
              ),
              LinearGaugeRange(
                startValue: 6,
                endValue: 8,
                color: Colors.green,
              ),
              LinearGaugeRange(
                startValue: 8,
                endValue: 14,
                color: Colors.blue,
              ),
            ],
            markerPointers: [
              LinearShapePointer(
                value: phValue,
                width: 5, // Adjust the width as needed
                height: 15, // Adjust the height as needed
                color: Colors.black87,
                shapeType: LinearShapePointerType.invertedTriangle,
              ),
            ],
          ),
        ),
        // Display log pH values on the right side (larger size)
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.blue, // Change color as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log pH Values',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 16),
                // Replace the following ListView with your actual log pH values
                ListView(
                  shrinkWrap: true,
                  children: [
                    Text('pH current value :$phValue', style: TextStyle(color: Colors.white)),
                    Text('pH past value  :${phValue+3.0}', style: TextStyle(color: Colors.white)),
                    // Add more log pH values as needed
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EmissionTrackingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<FlSpot> chartData = [
      FlSpot(0, 3),
      FlSpot(1, 4),
      FlSpot(2, 3.5),
      FlSpot(3, 5),
      FlSpot(4, 4),
      FlSpot(5, 6),
    ];

    if (chartData.isNotEmpty) {
      return Container(
        color: Colors.green,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Emission Tracking',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(16),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: chartData,
                        isCurved: true,
                        color: Colors.green,
                        barWidth: 4,
                        belowBarData: BarAreaData(show: false),
                        dotData: FlDotData(show: true),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}

class SalinityStatsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> chartData = [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: 3,
            width: 16,
            color: Colors.orange,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: 4,
            width: 16,
            color: Colors.orange,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: 3.5,
            width: 16,
            color: Colors.orange,
          ),
        ],
      ),
      // Add more data as needed
    ];

    return Container(
      color: Colors.orange,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Salinity Level Stats',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 1.5, // Adjust the aspect ratio as needed
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: BarChart(
                    BarChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(
                        show: false,
                        border: Border.all(color: Colors.transparent),
                      ),
                      barGroups: chartData,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class CommunicationStatsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for the log messages, replace it with your actual data
    List<String> logMessages = [
      'Log message 1',
      'Log message 2',
      'Log message 3',
      // Add more log messages as needed
    ];

    return Container(
      color: Colors.blue, // Change color as needed
      child: Container(
        height: 300, // Set a fixed height or adjust as needed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Communication Stats',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: ListView.builder(
                  reverse: true, // Reverse the order of items
                  itemCount: logMessages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        logMessages[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
