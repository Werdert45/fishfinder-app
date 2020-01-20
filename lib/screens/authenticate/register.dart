import 'package:flutter/material.dart';
import 'package:fishfinder_app/services/auth.dart';
import 'package:fishfinder_app/shared/constants.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Flutter app'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                      onChanged: (val) {
                        setState(() => email = val);
                      }
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                      color: Colors.pink,
                      child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white)
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.registerWithEmail(email, password);
                          if (result == null) {
                            setState(() => error = 'please supply a valid email');
                          }
                        }
                      }
                  ),
                  SizedBox(height: 12),
                  Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0)
                  )
                ],
              )
          )
      ),
    );
  }
}
