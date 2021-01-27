import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginFirebase/main.dart';
import 'package:loginFirebase/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page2 extends StatefulWidget {
  GoogleSignIn _good;
  Page2(GoogleSignIn good) {
    this._good = good;
  }
  @override
  _Page2State createState() => _Page2State(_good);
}

Color _darkblue = Colors.blue[600];
Color _blue = Colors.blue[300];

class _Page2State extends State<Page2> {
  GoogleSignIn googleSignIn;

  _Page2State(GoogleSignIn good) {
    this.googleSignIn = good;
  }

  String emailSP = '';
  String userId = '';
  String name = '';
  String email = '';
  String age = '';
  String gender = '';
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userIDSPKey');

    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    // debugPrint("      UserId:  " + userId);
    DatabaseReference databaseReference =
        firebaseDatabase.reference().child("userData").child(userId);
    databaseReference.once().then((DataSnapshot dataSnapshot) {
      // dataSnapshot.value['name'].toString();
      setState(() {
        name = dataSnapshot.value['name'].toString();
        gender = dataSnapshot.value['gender'].toString();
        age = dataSnapshot.value['age'].toString();
        email = dataSnapshot.value['email'].toString();
      });
    });
  }

  _logout() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('userIDSPKey', '');
      prefs.setString('emailSPKey', '');
      prefs.setString('loginSP', "nomail");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text(
            "Welcome",
            style: TextStyle(
              color: _darkblue,
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              CircleAvatar(
                backgroundColor: _blue,
                radius: 80,
                backgroundImage: AssetImage('images/flutter.jpeg'),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(12),
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Name:- ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          '$name',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.all(6),
                        child: Divider(
                          height: 8,
                          thickness: 2,
                          color: Colors.white,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Email:- ',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          '$email',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.all(6),
                        child: Divider(
                          height: 8,
                          thickness: 2,
                          color: Colors.white,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Gender:- ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          '$gender',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.all(6),
                        child: Divider(
                          height: 8,
                          thickness: 2,
                          color: Colors.white,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Age:- ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          '$age',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 55,
                      width: 175,
                      child: RaisedButton(
                        elevation: 5,
                        color: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          //  debugPrint(googleSignIn.signOut().toString());
                          //  debugPrint('OK');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddData()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.person_add,
                              color: _darkblue,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Add Data",
                              style: TextStyle(
                                color: _darkblue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: 175,
                      child: RaisedButton(
                        elevation: 5,
                        color: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => widgets()),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.book,
                              color: _darkblue,
                            ),
                            Text(
                              " Learn Flutter",
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
              SizedBox(
                height: 12,
              ),
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
                    googleSignIn.signOut().toString();
                    //  debugPrint('OK');
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Head()));

                    _logout();
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
                        "  Logout",
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

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final _formKey = GlobalKey<FormState>();
  String id, name, gender, age, userId, email;
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerMobile = new TextEditingController();
  TextEditingController controllerAge = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  @override
  void initState() {
    super.initState();
    retriveData();
  }

  retriveData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // emailSP = prefs.getString('emailSPKey');
      userId = prefs.getString('userIDSPKey');
      email = prefs.getString('emailSPKey');
    });
  }

  void addData() {
    if (_formKey.currentState.validate()) {
      name = controllerName.text;
      gender = controllerMobile.text;
      age = controllerAge.text;
      FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
      DatabaseReference databaseReference = firebaseDatabase.reference();
      databaseReference.child("userData").child(userId).set({
        "name": name,
        "gender": gender,
        "age": age,
        "email": email,
      });
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Adding Details...")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text(
            "Add Data",
            style: TextStyle(
              color: _darkblue,
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controllerName,
                    decoration: InputDecoration(
                      hintText: "Enter name",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "name cannot be empty";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controllerMobile,
                    decoration: InputDecoration(
                      hintText: "Gender",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "contact cannot be empty";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controllerAge,
                    decoration: InputDecoration(
                      hintText: "Enter age",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "age cannot be empty";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 13,
                  ),
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
                        addData();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Page2(googleSignIn)));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.person_add,
                            color: _darkblue,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "  Add Data",
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
        ),
      ),
    );
  }
}
