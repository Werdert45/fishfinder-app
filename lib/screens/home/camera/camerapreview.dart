import 'dart:convert';
import 'package:fishfinder_app/screens/home/species/preview_species.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:tflite/tflite.dart';
import 'package:fishfinder_app/models/species.dart';
import 'package:fishfinder_app/screens/home/species/species.dart';
import 'package:image/image.dart' as Img;

// @author Ian Ronk
// @class DisplayPictureScreen

// TODO Add the function of removing the image if the image is taken through the app
// TODO add loading circle

class DisplayPictureScreen extends StatefulWidget {

  // Get path to image
  final String imagePath;
  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {

  File _image;
  List _recognitions;
  List test;
  double _imageHeight;
  double _imageWidth;
  bool _busy = false;


  Future predictImagePicker() async {

    var directory = await getApplicationDocumentsDirectory();
    var directoryPlace = directory.toString().split(" ")[1].replaceAll(RegExp(r"[\']+"), '');

    var tempImage = Img.decodeImage(await File(widget.imagePath).readAsBytes());
    var cropped = Img.copyResize(tempImage, height: 224);

//    var previewImage = widget.imagePath.split(".");
//    var previewImagePath = previewImage[0] + "_preview.png";


    var previewImagePath = (directoryPlace + '/preview.png').toString();

    print(previewImagePath);
    File(previewImagePath).writeAsBytesSync(Img.encodePng(cropped));

    var image = await File(previewImagePath);
    if (image == null) return;
    setState(() {
      _busy = true;
    });

    if (image == null) return;

    new FileImage(image)
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      setState(() {
        _imageHeight = info.image.height.toDouble();
        _imageWidth = info.image.width.toDouble();
      });
    }));

    setState(() {
      _image = image;
      _busy = false;
    });

    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions;
    });

    String speciesList = await DefaultAssetBundle.of(context).loadString(
        'assets/json/species.json');
    List<dynamic> species = json.decode(speciesList);

    var speciesName = species[_recognitions[0]['index']];

    // Check if _recognitions are made
    if (_recognitions != null) {
      // convert the index from the list to a species object
      Species speciesType = Species.fromJSON(speciesName);
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => PreviewSpeciesScreen(),
          settings: RouteSettings(
              arguments: speciesType
          )
      )
      );
    }

  }

    Future loadModel() async {
      Tflite.close();
      await Tflite.loadModel(
        model: "assets/tflite/fishfinder.tflite",
        labels: "assets/tflite/labels.txt",
      );
    }

    @override
  void initState() {
    super.initState();

    _busy = true;

    loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The image is extracted from either gallery or made picture
      body: Stack(
        children: <Widget>[
          // Get image file by file path
          Image.file(File(widget.imagePath),fit: BoxFit.cover, height: double.infinity, width: double.infinity, alignment: Alignment.center),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                  margin: const EdgeInsets.only(top: 30, right: 30),
                  child: IconButton(
                    icon: Icon(Icons.clear, size: 40, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              )
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await predictImagePicker();
        },
        label: Row(
          children: <Widget>[Text("SCAN"), SizedBox(width: 10), Icon(Icons.done)],
        ),
        icon: Container(),
        backgroundColor: Colors.deepOrange,
        splashColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
