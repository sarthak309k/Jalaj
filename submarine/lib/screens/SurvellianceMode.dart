import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CameraTab extends StatefulWidget {
  @override
  _CameraTabState createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> {
  late VideoPlayerController _controller;
  final String videoUrl = "https://www.youtube.com/embed/hasdCkzXrhE?si=kS15wT1SvIJhHcjZ";
  double staticLatitude = 37.7749;
  double staticLongitude = -122.4194;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_controller.value.isInitialized)
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        else
          CircularProgressIndicator(),
        SizedBox(height: 16),
        // Your additional widgets or information here
        SizedBox(height: 16),
        Text(
          'Current Location:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Latitude: $staticLatitude',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Longitude: $staticLongitude',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

