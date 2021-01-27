import 'package:flutter/material.dart';
Color _darkblue = Colors.blue[600];
class Backk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                height: 50,
                child: RaisedButton(
                  elevation: 5,
                  color: Color(0xFFFFFFFF),
                  padding: EdgeInsets.only(
                    left: 48,
                    right: 48,
                    top: 8,
                    bottom: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back_ios,
                        color: _darkblue,
                      ),
                      SizedBox(width: 4),
                      Text(
                        " Back",
                        style: TextStyle(
                          color: _darkblue,
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}