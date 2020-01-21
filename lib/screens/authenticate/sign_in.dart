import 'package:fishfinder_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/shared/constants.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
        title: Text('Sign in to Flutter app'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
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
                          'Sign In',
                          style: TextStyle(color: Colors.white)
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.signInWithEmail(email, password);

                          if (result == null) {
                            setState(() => error = 'No user found with this email');
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