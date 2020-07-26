import 'package:camera/camera.dart';
import 'package:fishfinder_app/services/calculations/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image/image.dart' as img;

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
];

List<Widget> _tiles = const <Widget>[
  const _Example01Tile(Colors.green, Icons.widgets),
  const _Example01Tile(Colors.lightBlue, Icons.wifi),
  const _Example01Tile(Colors.amber, Icons.panorama_wide_angle),
  const _Example01Tile(Colors.brown, Icons.map),
  const _Example01Tile(Colors.deepOrange, Icons.send),
  const _Example01Tile(Colors.indigo, Icons.airline_seat_flat),
  const _Example01Tile(Colors.red, Icons.bluetooth),
  const _Example01Tile(Colors.pink, Icons.battery_alert),
];

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: MediaQuery.of(context).size.height * 0.7,
        color: Colors.red,
        child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 3,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              padding: const EdgeInsets.all(4.0),
            )),
      ),
    );
  }
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;



  @override
  Widget build(BuildContext context) {

    var image = Image.network('https://image.shutterstock.com/image-photo/gold-fish-isolated-on-white-260nw-580306465.jpg');



    return Padding(
      padding: EdgeInsets.all(0),
      child: FutureBuilder(
        future: getImagePalette(image),
        builder: (context, snapshot) {

          print(snapshot.error);
//          Color textColor = snapshot.data.computeLuminance() > 0.5 ? Colors.black : Colors.white;

          return new Container(
//      color: backgroundColor,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage('https://image.shutterstock.com/image-photo/gold-fish-isolated-on-white-260nw-580306465.jpg'),
                    fit: BoxFit.fill
                )
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: constraints.maxWidth,
                        height: 50,
                        color: Color.fromRGBO(255, 255, 255, 0.19),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Snoekbaars", style: TextStyle(color: Colors.white, fontSize: 16)),
                              SizedBox(height: 3),
                              Text("Ian Ronk", style: TextStyle(color: Colors.grey))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        }
      ),
    );
  }
}
