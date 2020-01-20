import 'package:fishfinder_app/main.dart';
import 'package:flutter/widgets.dart';
import 'package:fishfinder_app/screens/home/homescreen/homescreen.dart';
import 'package:fishfinder_app/screens/home/camera/helpers/camerascreen.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => MainMenu(),
  '/camera': (BuildContext context) => CameraScreen(cameras),
};