import 'package:flutter/material.dart';
import 'package:vibelit/config/styles.dart';
import 'package:vibelit/widget/button/icon_circle_button.dart';
import 'dart:math' as math;

class StopButton extends StatefulWidget {

  final double width, height;
  final VoidCallback onClick;

  StopButton({this.width, this.height, this.onClick});

  @override
  _StopButtonState createState() => _StopButtonState();
}

class _StopButtonState extends State<StopButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width + widget.height / 2,
      height: widget.height,
      child: Stack(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.centerRight,
                radius: 0.6,
                colors: [Color(0xFFd8d8d8), Color(0xff536c82)],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: widget.height,
              height: widget.height,
              decoration: new BoxDecoration(
                color: Color(0xFF4c647b),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconCircleButton(
              icon: Transform.rotate(
                angle: math.pi / 2,
                child: Icon(Icons.remove_circle_outline, size: widget.height / 2, color: Styles.primaryGreen,),
              ),
              padding: widget.height / 4,
              size: widget.height / 2,
              onClick: () => widget.onClick(),
            ),
          )
        ],
      ),
    );
  }
}
