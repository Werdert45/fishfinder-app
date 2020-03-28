import 'package:flutter/material.dart';
import 'package:fishfinder_app/services/auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: IconButton(icon: Icon(Icons.exit_to_app),
                onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
            }
                ),
          )
        ],
      )
    );
  }
}
