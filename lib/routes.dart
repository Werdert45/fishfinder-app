import 'package:fishfinder_app/main.dart';
import 'package:flutter/widgets.dart';
import 'package:fishfinder_app/screens/home/homescreen/home.dart';
import 'package:fishfinder_app/screens/home/camera/camerascreen.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => MainMenu(cameras),
  '/camera': (BuildContext context) => CameraScreen(cameras),
};