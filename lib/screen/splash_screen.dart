import 'package:flutter/material.dart';
import 'package:vibelit/config/styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryGrey,
      body: Center(
        child: Text("VibeLit", style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
