import 'package:fishfinder_app/services/database.dart';
import 'package:flutter/material.dart';

class FriendsSearch extends SearchDelegate<String> {

  final users;

  FriendsSearch(this.users);

  @override

  List<Widget> buildActions(BuildContext context) {

    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      })
    ];
  }

  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ), onPressed: (){
      close(context, null);
    });
  }

  Widget buildResults(BuildContext context) {

  }

  Widget buildSuggestions(BuildContext context) {

    var userList = [];
    var userIDs = [];

    print(users[0]);


    checkQuery(user, query) {
      if (query == "") {
        for (int i = 0; i < user.length; i++) {
          userList.add(user[i][1]);
          userIDs.add(user[i][0]);
        }

        return true;
      }

      for (int i = 0; i < user.length; i++) {
        if (user[i][1].toString().toLowerCase().contains(query)) {
          userList.add(user[i][1]);
          userIDs.add(user[i][0]);
        }
      }
    }

    checkQuery(users[0], query.toLowerCase());

    print(userIDs);

//    final userList = query.isEmpty ? user : user.where((p)=>p.name.contains(query)).toList();

    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          if (users[2].contains(userList[index])) {
            return ListTile(
              title: Text(userList[index]),
              trailing: IconButton(
               icon: Icon(Icons.done),
              )

            );
          }
          else {
            return ListTile(
              title: Text(userList[index]),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  print(userIDs[index]);
                  DatabaseService().addFriends(userList[index], userIDs[index], users[1]);
                },
              ),
            );
          }

        });
  }
}