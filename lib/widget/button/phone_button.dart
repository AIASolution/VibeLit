import 'package:flutter/material.dart';
import 'package:vibelit/config/styles.dart';

import 'icon_circle_button.dart';

class PhoneButton extends StatefulWidget {

  final double width, height;
  final VoidCallback onClick;

  PhoneButton({this.width, this.height, this.onClick});

  @override
  _PhoneButtonState createState() => _PhoneButtonState();
}

class _PhoneButtonState extends State<PhoneButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width + widget.height / 2,
      height: widget.height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.centerLeft,
                  radius: 0.6,
                  colors: [Color(0xFFd8d8d8), Color(0xff536c82)],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
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
            alignment: Alignment.centerLeft,
            child: IconCircleButton(
              icon: Icon(Icons.phone_iphone, size: widget.height / 2, color: Colors.white,),
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
