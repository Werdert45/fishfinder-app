import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fishfinder_app/models/preview_species.dart';
import 'dart:convert';

class SpeciesPage extends StatefulWidget {
  @override
  _SpeciesPageState createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/json/preview_species.json'),
          builder: (context, snapshot) {
            List<previewSpecies> species = parseJSON(snapshot.data.toString());
          }
        )
      )
    );
  }

  List<previewSpecies> parseJSON(String response) {
    if (response == null) {
      return [];
    }
    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<previewSpecies>((json) => new previewSpecies.fromJSON(json)).toList();
  }
}
