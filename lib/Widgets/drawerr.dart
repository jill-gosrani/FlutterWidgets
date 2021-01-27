import 'package:flutter/material.dart';

Color _darkblue = Colors.blue[600];

class LDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: AppBar(title: Text("Navigation Drawer")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Click Top left Icon!!"),
                SizedBox(
                  height: 45,
                  width: 250,
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
                          Icons.arrow_back,
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
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Item 1'),
                  leading: Icon(
                    Icons.alarm,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.message,
                  ),
                  title: Text('Item 2'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  leading: Icon(
                    Icons.email,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 3'),
                  leading: Icon(
                    Icons.phone,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 4'),
                  leading: Icon(
                    Icons.camera,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 5'),
                  leading: Icon(
                    Icons.watch,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 6'),
                  leading: Icon(
                    Icons.exit_to_app,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
