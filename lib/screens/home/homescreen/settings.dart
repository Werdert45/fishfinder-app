import 'package:firebase_auth/firebase_auth.dart';
import 'package:fishfinder_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/services/auth.dart';
import 'payment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Item {
  const Item(this.name);
  final String name;
}

class SettingsPage extends StatefulWidget {
  final String uid;

  SettingsPage(this.uid);


  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AuthService _auth = AuthService();



  Future<Null> changePassword(String newPassword) async {
    const String API_KEY = 'AIzaSyBGpzlpJPWgKvDf76Rdqmu4FrD-B7Kefvo';
    final String changePasswordUrl =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/setAccountInfo?key=$API_KEY';

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    final String idToken = await user.getIdToken().toString(); // where user is FirebaseUser user

    final Map<String, dynamic> payload = {
      'email': idToken,
      'password': newPassword,
      'returnSecureToken': true
    };

    await http.post(changePasswordUrl,
      body: json.encode(payload),
      headers: {'Content-Type': 'application/json'},
    );
  }


  _logoutButton() {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.2, color: Colors.lightBlue.shade900),
          ),
        ),
        child: ListTile(
            onTap: () async {
              await _auth.signOut();
              Navigator.pop(context);
            },
            title: Text('Logout from the App'),
            leading: Icon(Icons.exit_to_app)
        )
    );
  }

  Map languagePairs = {'English': 'en', 'Nederlands (Dutch)': 'nl', 'Italiano (Italian)': 'it'};

  String languageID;


  Item selectedUser;
  List<Item> users = <Item>[
    const Item('English'),
    const Item('Nederlands (Dutch)'),
    const Item('Italiano (Italian)'),
  ];


  final emailController = TextEditingController();

  final nameController = TextEditingController();
//  final passwordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (selectedUser != null) {
      languageID = languagePairs[selectedUser.name];
    }
    changePassword('test');

    return Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.close, size: 30, color: Colors.black),
                                  onPressed: () {
                                    if (selectedUser != null) {
                                      DatabaseService().updateLanguage(languageID, widget.uid);
                                    }
                                    if (emailController.text != "") {
                                      DatabaseService().updateEmail(emailController.text, widget.uid);

                                    }

                                    if (nameController.text != "") {
                                      DatabaseService().updateName(nameController.text, widget.uid);
                                    }
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: Text('Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                            )
                          ],
                        ),

                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text('ACCOUNT')
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 0.2, color: Colors.lightBlue.shade900),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: TextField(
                                      controller: emailController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'ian.ronk0@gmail.com'
                                        )

                                    ),
                                    leading: Icon(Icons.email),
                                  )
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 0.2, color: Colors.lightBlue.shade900),
                                    ),
                                  ),
                                  child: ListTile(
                                      title: TextField(
                                        controller: nameController,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Ian Ronk'
                                          )

                                      ),
                                      leading: Icon(Icons.account_box)
                                  )
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 0.2, color: Colors.lightBlue.shade900),
                                    ),
                                  ),
                                  child: ListTile(
                                      title: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '********'
                                        ),
                                      ),
                                      leading: Icon(Icons.lock)
                                  )
                              ),

                              SizedBox(height: 25),

                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text('LANGUAGE')
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                  ),
                                  child: ListTile(
                                    title: DropdownButton<Item>(
                                      hint:  Text("Please select a language"),
                                      value: selectedUser,
                                      onChanged: (Item Value) {
                                        setState(() {
                                          selectedUser = Value;
                                        });
                                      },
                                      items: users.map((Item user) {
                                        return  DropdownMenuItem<Item>(
                                          value: user,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                user.name,
                                                style:  TextStyle(color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    leading: Icon(Icons.flag),
                                  )
                              ),
                              SizedBox(height: 50),
                              Container(
                                  width: (MediaQuery.of(context).size.width - 20),
                                  height: 185,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.grey.shade200,
                                            offset: Offset(2, 4),
                                            blurRadius: 5,
                                            spreadRadius: 2)
                                      ],
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                width: 200,
                                                child: Text("Upgrade to Premium Membership", textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(fontSize: 20, color: Colors.white)),
                                              )
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: Text("- Sync with server", textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(fontSize: 15, color: Colors.white)),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: Text("- See friends' catches", textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(fontSize: 15, color: Colors.white)),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: <Widget>[
                                          OutlineButton(
                                            child: Container(
                                                child: SizedBox(
                                                    width: 125,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Text('Upgrade Now \$0.99', textAlign: TextAlign.left, textDirection: TextDirection.ltr ,style: TextStyle(color: Colors.white)),
                                                      ],
                                                    )
                                                )
                                            ),
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumPaymentScreen()));
                                            },
                                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                            color: Colors.orange,
                                          ),

                                        ],
                                      ),
                                    ],
                                  )
                              ),
                              SizedBox(height: 20),
                              _logoutButton(),

                            ],
                          ),
                        )

                      ],
                    )
                )
            )
          ],
        )
    );
  }
}
