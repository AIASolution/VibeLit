import 'package:flutter/material.dart';
import 'package:vibelit/config/styles.dart';

class ProgressBar extends StatefulWidget {
  final double width, height, percent;
  final Color backgroundColor, progressColor;

  ProgressBar({this.width, this.height, this.percent, this.backgroundColor, this.progressColor});

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.height / 2)
        ),
      child: Container(
        width: widget.width * widget.percent / 100,
        height: widget.height,
        decoration: BoxDecoration(
            color: widget.progressColor,
            borderRadius: BorderRadius.circular(widget.height / 2)
        ),),
    );
  }
}
