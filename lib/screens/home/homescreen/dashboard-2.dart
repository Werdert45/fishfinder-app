import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishfinder_app/models/friends_catch.dart';
import 'package:fishfinder_app/models/user.dart';
import 'package:fishfinder_app/screens/authenticate/Widget/bezierContainer.dart';
import 'package:fishfinder_app/screens/home/fishdex/fishdex.dart';
import 'package:fishfinder_app/screens/home/homescreen/achievements.dart';
import 'package:fishfinder_app/screens/home/homescreen/friends.dart';
import 'package:fishfinder_app/screens/home/homescreen/history_search.dart';
import 'package:fishfinder_app/screens/home/homescreen/recentfriendsscroll.dart';
import 'package:fishfinder_app/services/backup.dart';
import 'package:fishfinder_app/services/calculations/ads.dart';
import 'package:fishfinder_app/services/calculations/language.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/services/auth.dart';
import 'package:fishfinder_app/screens/home/camera/camerascreen.dart';
import 'package:camera/camera.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'settings.dart';
import 'package:fishfinder_app/shared/constants.dart';
import 'package:fishfinder_app/models/species.dart';
import 'package:fishfinder_app/screens/home/homescreen/recentscroll.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_admob/firebase_admob.dart';

var testDevice = 'ca-app-pub-8771008967458694~3342723025';

// @author Ian Ronk
// @class DashBoardPage

class DashBoardPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  DashBoardPage(this.cameras);



  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override

  void initState() {
    FirebaseAdMob.instance.initialize(
        appId: BannerAd.testAdUnitId
    );
//    _bannerAd = createBannerAd()..load()..show();
    super.initState();

  }
  final AuthService _auth = AuthService();

  String languageFromSettings;

  String root_folder = '/data/user/0/machinelearningsolutions.fishfinder_app/app_flutter';

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future checkSubscription() async {
    final prefs = await _prefs;

    if (prefs.getBool("premiumSubscription") == null) {
      await prefs.setBool("premiumSubscription", false);
    }

    return prefs.getBool("premiumSubscription");
  }



  Future dailyScansAmount() async {
    final prefs = await _prefs;

    if (prefs.getStringList("date") == null) {
      await prefs.setStringList("date", [DateFormat.y().format(DateTime.now()), DateFormat.M().format(DateTime.now()), DateFormat.d().format(DateTime.now())]);
    }

    else {
      var dateList = prefs.getStringList("date");
      var dates = [DateFormat.y().format(DateTime.now()), DateFormat.y().format(DateTime.now()), DateFormat.y().format(DateTime.now())];

      for (int i = 0; i < dateList.length; i++) {
        if (dateList[i] != dates[i]) {
          await prefs.setInt("scansAmount", 5);
        }
      }
    }
  }

  Widget _fishdexButton(text, link) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FishDex(widget.cameras)));
      },
      child: Container(
        width: 85,
        padding: EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }


  Widget build(BuildContext context) {
//    rebuildAllChildren(context);
    var user = Provider.of<User>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            ],
          ),
        ),
      ),
    );

  }

}

