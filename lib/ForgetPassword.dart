import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

Color _darkblue = Colors.blue[600];


class _ForgetPasswordState extends State<ForgetPassword> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  _resetPassword(String email) {
    FirebaseAuth fire = FirebaseAuth.instance;
    fire.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Enter Email',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: _darkblue,
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body: Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.all(32),
            children: <Widget>[
              Text(
                'You will recieve a mail in the Mentioned Email Id',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
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
                width: 20,
              ),
              Container(
                margin: EdgeInsets.all(20),
              ),
              SizedBox(
                height: 50,
                child: RaisedButton(
                  padding: EdgeInsets.only(
                    left: 48,
                    right: 48,
                    top: 8,
                    bottom: 8,
                  ),
                  elevation: 5,
                  color: Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    // If statement is validating the input fields.
                    if (_formkey.currentState.validate()) {
                      _resetPassword(emailController.text);
                      Navigator.pop(context);
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.send,
                        color: _darkblue,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "  Send",
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
      ),
    );
  }
}
