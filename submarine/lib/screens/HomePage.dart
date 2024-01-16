import 'package:flutter/material.dart';
import 'package:submarine/screens/GraphPage.dart';
import 'package:submarine/screens/SurvellianceMode.dart';

import 'SeismicEvents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submarine Data'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          GraphPage(), // Load GraphPage content in the first tab
          // Replace this with the content for the second tab
          CameraTab(),
          // Replace this with the content for the third tab
          SeismicEventsChart(),

        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.data_thresholding_sharp),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_camera),
            label: 'Survillance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crisis_alert_sharp),
            label: 'Alerts',
          ),
        ],
      ),
    );
  }
}
