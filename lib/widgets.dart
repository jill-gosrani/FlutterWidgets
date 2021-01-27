import 'package:flutter/material.dart';
import 'Widgets/AlertDialog.dart';
import 'Widgets/AppBarFile.dart';
import 'Widgets/AspectRatio.dart';
import 'Widgets/ColorFilter.dart';
import 'Widgets/Divider.dart';
import 'Widgets/Flexible.dart';
import 'Widgets/IgnorePointer.dart';
import 'Widgets/Materialfile.dart';
import 'Widgets/RichText.dart';
import 'Widgets/Scaffoldfile.dart';
import 'Widgets/SelectableText.dart';
import 'Widgets/SizedBox.dart';
import 'Widgets/Spacer.dart';
import 'Widgets/ToolTip.dart';
import 'Widgets/columnFile.dart';
import 'Widgets/conFile.dart';
import 'Widgets/drawerr.dart';
import 'Widgets/geoLocation.dart';
import 'Widgets/imagePicker/selectimage.dart';
import 'Widgets/mediaQuery.dart';
import 'Widgets/silverAppBar.dart';
import 'Widgets/snackBar.dart';
import 'video.dart';

// ignore: camel_case_types
class widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: newState(),
    );
  }
}

Color _darkblue = Colors.blue[600];
Color _blue = Colors.blue[300];

// ignore: camel_case_types
class newState extends StatefulWidget {
  @override
  _newStateState createState() => _newStateState();
}

// ignore: camel_case_types
class _newStateState extends State<newState> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text(
            'Flutter Widgets',
            style: TextStyle(
              color: _darkblue,
              fontSize: 22,
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body: ListView(
          children: [
            raisedButton("MATERIAL APP ", LMaterialWidget()),
            raisedButton("SCAFFOLD ", LScaffoldWidget()),
            raisedButton("APP BAR ", LAppBarWidget()),
            raisedButton("SILVER APP BAR ", LSliverAppBar()),
            raisedButton("CONTAINER ", LCWidget()),
            raisedButton("SNACK BAR ", LSWidget()),
            raisedButton("COLUMN ", LColumn()),
            raisedButton("ALERT DIALOG ", LAlertWidget()),
            raisedButton("GEO LOCATION", geoLocation()),
            raisedButton("RICH TEXT ", Richtext()),
            raisedButton("SELECTABLE TEXT ", Selectabletext()),
            raisedButton("FLEXIBLE ", flexible()),
            raisedButton("MEDIA QUERY ", LMediaQuery()),
            raisedButton("SPACER ", spacer()),
            raisedButton("CAMERA ", ImageCapture()),
            raisedButton("VIDEO ", VidPlayer()),
            raisedButton("DIVIDER ", divider()),
            raisedButton("DRAWER ", LDrawer()),
            raisedButton("IGNORE POINTER ", ignorePointer()),
            raisedButton("COLOR FILTER ", colorFilter()),
            raisedButton("TOOL TIP ", tooltip()),
            raisedButton("ASPECT RATIO ", Aspectratio()),
            raisedButton("SIZED BOX ", Sizedbox()),
          ],
        ),
      ),
    );
  }

  Widget raisedButton(String text, Widget next) {
    return Container(
      margin: EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 60,
          width: double.maxFinite,
          child: RaisedButton(
            color: _blue,
            elevation: 5,
            onPressed: () {
              // ignore: unnecessary_statements
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => next));
            },
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
