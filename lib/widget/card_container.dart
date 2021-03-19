import 'package:flutter/material.dart';

class CardContainerWidget extends StatefulWidget {

  final Widget child;

  CardContainerWidget({this.child});

  @override
  _CardContainerWidgetState createState() => _CardContainerWidgetState();
}

class _CardContainerWidgetState extends State<CardContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Color(0xFFbacee0),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Color(0xff8b9399).withOpacity(0.6),
            spreadRadius: 15,
            blurRadius: 15,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: widget.child,
      ),
    );
  }
}
