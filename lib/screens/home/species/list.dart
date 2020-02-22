import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/models/preview_species.dart';

class SpeciesList extends StatelessWidget {
  final List<previewSpecies> species;
  SpeciesList({Key key, this.species}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      scrollDirection: Axis.vertical,
        child: GridView.builder(
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: species == null ? 0 : species.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  child: new Container(
                    padding: const EdgeInsets.all(15.0),
                    child: new Card(
                        elevation: 5.0,
                        child: new Container(
                            alignment: Alignment.center,
                            child: new Column(
                             children: <Widget>[
                               Image(image: AssetImage('assets/images/bitterling1.png')),
                               Text.rich(
                                 TextSpan(
                                   children: <TextSpan>[
                                     TextSpan(text: "#"),
                                     TextSpan(text: species[index].number),
                                     TextSpan(text: " "),
                                     TextSpan(text: species[index].name),

                                   ]
                                 )
                               ),
                             ],
                            )

                        )
                    ),
                  ),
                  onTap: () {

                  }
              );

            })
    );
  }

}