import 'package:flutter/material.dart';
Color _darkblue = Colors.blue[600];
class LMediaQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text(
            "MEDIA QUERY",
            style: TextStyle(
              color: _darkblue,
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Device Information:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black),
                ),
                Text(
                  "Orientation : " +
                      MediaQuery.of(context).orientation.toString(),
                ),
                Text(
                  "Size(w,h) : " + MediaQuery.of(context).size.toString(),
                ),
                Text(
                  "Pixel Ratio : " +
                      MediaQuery.of(context).devicePixelRatio.toString(),
                ),
                Text(
                  "Platform Brightness : " +
                      MediaQuery.of(context).platformBrightness.toString(),
                ),
                Text(
                  "Device padding : " + MediaQuery.of(context).padding.toString(),
                ),
                Text(
                  "Navigation Mode : " +
                      MediaQuery.of(context).navigationMode.toString(),
                ),
                Text(
                  "Navigation Mode : " +
                      MediaQuery.of(context).navigationMode.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
