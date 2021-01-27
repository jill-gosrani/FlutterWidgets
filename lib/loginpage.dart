import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginFirebase/Page.dart';
import 'package:loginFirebase/SignUP.dart';
import 'package:loginFirebase/ForgetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

class LoginPage extends StatefulWidget {
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

Color _darkblue = Colors.blue[600];
Color _blue = Colors.blue[300];

class LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text(
            "Login Using Email  ",
            style: TextStyle(
              color: _darkblue,
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body: Builder(
          builder: _loginPageSaffoldBody,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    alreadyLoggedIn();
  }

  alreadyLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    lgin = prefs.getString('loginSP') ?? "nomail";
    // ddd
    if (lgin != "nomail") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Page2(googleSignIn)));
    } else {
      lgin = "nomail";
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String lgin = '';
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  _signInUsingEmail(String email, String pass) {
    FirebaseAuth fire = FirebaseAuth.instance;
    fire
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((AuthResult authResult) async {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Page2(googleSignIn)));
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userIDSPKey', authResult.user.uid);
      prefs.setString('emailSPKey', email);
      prefs.setString('loginSP', email);
    }).catchError((error) {
      final snackBar =
          SnackBar(content: Text("Please Enter correct Email and Password"));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    });
  }

  Widget _loginPageSaffoldBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          Center(
            child: Icon(
              Icons.person_outline,
              size: 128,
              color: _blue,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            validator: (String content) {
              if (content.length == 0) {
                return "Please enter valid email";
              } else {
                return null;
              }
            },
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter Your Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            obscureText: true,
            validator: (String content) {
              if (content.length < 8) {
                return "Minimum 8 digit password";
              } else {
                return null;
              }
            },
            controller: passController,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter Your Password",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
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
              // If statement is validating the input fields.
              if (_formKey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Checking",
                    ),
                  ),
                );
                _signInUsingEmail(emailController.text, passController.text);
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.lock_open,
                  color: _darkblue,
                ),
                SizedBox(width: 4),
                Text(
                  "Submit",
                  style: TextStyle(
                    color: _darkblue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUPPage()));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.lock,
                  color: _darkblue,
                ),
                SizedBox(width: 4),
                Text(
                  "SignUp",
                  style: TextStyle(
                    color: _darkblue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgetPassword(),
                ),
              );
            },
            child: Text(
              'Forget Password',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
