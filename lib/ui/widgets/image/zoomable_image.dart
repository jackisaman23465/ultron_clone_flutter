import 'package:flutter/material.dart';

class ZoomableImage extends StatefulWidget {
  final String imagePath;

  const ZoomableImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (ScaleStartDetails details) {
        _previousScale = _scale;
        setState(() {});
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        _scale = _previousScale * details.scale;
        setState(() {});
      },
      onScaleEnd: (ScaleEndDetails details) {
        _previousScale = 1.0;
        setState(() {});
      },
      child: InteractiveViewer(
        boundaryMargin: EdgeInsets.all(20.0),
        minScale: 0.5,
        maxScale: 4.0,
        scaleEnabled: true,
        panEnabled: true,
        child: Image.asset(
          widget.imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}





