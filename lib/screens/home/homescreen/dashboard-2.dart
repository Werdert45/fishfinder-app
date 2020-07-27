import 'package:fishfinder_app/models/user.dart';
import 'package:fishfinder_app/screens/fluid_tab/fluid_nav_bar.dart';
import 'package:fishfinder_app/screens/home/homescreen/home_screens/account_content.dart';
import 'package:fishfinder_app/screens/home/homescreen/home_screens/catches_content.dart';
import 'package:fishfinder_app/screens/home/homescreen/home_screens/home_content.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';



// @author Ian Ronk
// @class DashBoardPage



class DashBoardPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  DashBoardPage(this.cameras);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> with WidgetsBindingObserver {
//  GlobalKey containerKey = GlobalKey();
  Widget _child;
//  @override

//  _getPositions() {
//    final RenderBox renderBoxRed = containerKey.currentContext.findRenderObject();
//    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
//    print("POSITION of Red: $positionRed ");
//  }
//
//  _afterLayout(_) {
//    _getPositions();
//  }

  bool atBottom = false;

  void initState() {
//    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
//    WidgetsBinding.instance.addObserver(this);
    super.initState();


    // set up listener here
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
//          print("AT TOP");
        }
      // you are at top position
        else {
          setState(() {
            atBottom = true;
          });
        }
      // you are at bottom position
    }
      else {
        setState(() {
          atBottom = false;
        });
      }
    });
  }

  @override
  void dispose() {
//    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  var _controller = ScrollController();

  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Color(0xFF75B7E1),
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Container(
                  height: 100,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Icon(Icons.settings),
                      )
                    ],
                  ),
              ),
              Column(
//                  key: containerKey,
                children: [
                  FluidNavBar(onChange: _handleNavigationChange),
                  // 80 % of height
                  !atBottom ? Container(height: MediaQuery.of(context).size.height - 135, width: double.infinity, color: Colors.red, child: _child) : Container(height: MediaQuery.of(context).size.height - 135, width: double.infinity, color: Colors.blue, child: _child),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }




  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeScreenContent();
          break;
        case 1:
          _child = CatchesContent();
          break;
        case 2:
          _child = AccountContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,);
    });
  }

}

