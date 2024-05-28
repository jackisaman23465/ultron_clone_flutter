import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final Color? thumbColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final int? divisions;

  const CustomSlider({
    Key? key,
    this.thumbColor,
    this.activeColor,
    this.inactiveColor,
    this.divisions,
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      label: _currentSliderValue.toInt().toString(),
      thumbColor: widget.thumbColor,
      activeColor: widget.activeColor,
      inactiveColor: widget.inactiveColor,
      divisions: widget.divisions,
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
