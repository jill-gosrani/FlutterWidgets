import "package:flutter/material.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginFirebase/Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginFirebase/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Head());
}
Color _darkblue=Colors.blue[600];
// Color _blue = Colors.blue[300];
// hs
class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:Colors.blueAccent,
      ),
      title: 'Flutter Wigdets',
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void initState() {
    super.initState();
    alreadyLoggedIn();
  }

  alreadyLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    lgin = prefs.getString('loginSP') ?? "nomail";
    // ddd
    if (lgin != "nomail") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Page2(googleSignIn)));
    } else {
      lgin = "nomail";
    }
  }

  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth fire = FirebaseAuth.instance;
  String lgin = '';

  Future<FirebaseUser> _signIn(BuildContext context) async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    FirebaseUser userDetails =
        (await fire.signInWithCredential(credential)).user;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Page2(googleSignIn)));

    // debugPrint(userDetails.uid);
    // debugPrint(userDetails.email);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userIDSPKey', userDetails.uid);
    debugPrint("      Normal  " + userDetails.uid);
    debugPrint("       SharedPrefs vala:  " + prefs.getString('userIDSPKey'));
    prefs.setString('emailSPKey', userDetails.email);
    prefs.setString('loginSP', userDetails.email);
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Flutter Wigets',
            style: TextStyle(
              color: _darkblue,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body:Column(
          children: [
            Container(
          height: (MediaQuery.of(context).size.height* 0.7)+74,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/why.png"),
              fit: BoxFit.fill,
            ),
          ),
          ),
          Container(
            color: Color.fromRGBO(249,213,186,0.7),
            height: MediaQuery.of(context).size.height* 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height:50,
                  width: 150,
                  child: RaisedButton(
                    color: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.alternate_email,
                          color:_darkblue,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "  Email",
                          style: TextStyle(
                            color:_darkblue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width:28,
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: RaisedButton(                  
                    color: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {
                      _signIn(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.group,
                          color:_darkblue,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "  Google",
                          style: TextStyle(
                            color:_darkblue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
 
          ],
        ),
         
      ),
    );
  }
}
