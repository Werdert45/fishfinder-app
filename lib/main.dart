import 'dart:async';
import 'package:fishfinder_app/models/user.dart';
import 'package:fishfinder_app/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:fishfinder_app/routes.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras  = await availableCameras();
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: routes
      ),
    );
  }
}
