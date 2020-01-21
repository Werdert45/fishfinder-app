import 'package:fishfinder_app/main.dart';
import 'package:flutter/widgets.dart';
import 'package:fishfinder_app/screens/home/homescreen/home.dart';
import 'package:fishfinder_app/screens/home/camera/camerascreen.dart';
import 'package:fishfinder_app/screens/home/fishdex/fishdex.dart';
import 'package:fishfinder_app/screens/wrapper.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => Wrapper(cameras:cameras),
  '/home': (BuildContext context) => MainMenu(cameras),
  '/camera': (BuildContext context) => CameraScreen(cameras),
  '/fishdex': (BuildContext context) => FishDex(cameras),
};