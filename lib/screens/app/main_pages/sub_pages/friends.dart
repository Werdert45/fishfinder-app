import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishfinder_app/models/friendTile.dart';
import 'package:fishfinder_app/screens/elements/search_bar/searchBar.dart';
import 'package:fishfinder_app/services/database_service.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:fishfinder_app/screens/elements/search_bar/no_item_found.dart';


class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {

  List<FriendTile> getUserDataFromSnapshot(List<DocumentSnapshot> users)
  {
    var new_users = [];

    for (int i=0; i<users.length; i++)
    {
      new_users.add(FriendTile(users[i]['uid'], users[i]['name']));
    }

    return new_users;
  }

  @override
  Widget build(BuildContext context) {
    final Streams streams = Streams();

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: streams.users,
          builder: (context, snapshot) {
            var users = snapshot.data.documents;
            List<FriendTile> list = [];

            for (int i=0; i<users.length; i++)
            {
              list.add(FriendTile(users[i]['uid'], users[i]['name']));
            }

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 60, child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {Navigator.pop(context);})),
                      SizedBox(width: 140, child: Text("Friends", style: TextStyle(fontSize: 28))),
                      SizedBox(width: 0)
                        ],
                  ),
                  SizedBox(height: 15),
                  SearchWidget<FriendTile>(
                    dataList: list,
                    hideSearchBoxWhenItemSelected: false,
                    listContainerHeight: MediaQuery.of(context).size.height / 4,
                    queryBuilder: (String query, List<FriendTile> list) {
                      return list.where((FriendTile item) => item.name.toLowerCase().contains(query.toLowerCase())).toList();
                    },
                    popupListItemBuilder: (FriendTile item) {
                      return PopupListItemWidget(item);
                    },
                    selectedItemBuilder: (FriendTile selectedItem, VoidCallback deleteSelectedItem) {
                      return SelectedItemWidget(selectedItem, deleteSelectedItem);
                    },
                    // widget customization
                    noItemsFoundWidget: NoItemsFound(),
                    textFieldBuilder: (TextEditingController controller, FocusNode focusNode) {
                      return MyTextField(controller, focusNode);
                    },
                  ),
                  SizedBox(height: 20),
                  // Body of the friends
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Text("Friend Requests", style: TextStyle(fontSize: 18)),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 3*50.0,
                          child: ListView.builder(
                            itemBuilder: (context, index)
                            {
                              return ListTile(
                                visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                                title: Text("Kelvin Baldwin"),
                                leading: Icon(Icons.email, size:30),
                                trailing: Container(
                                  width: 120,
                                  child: Row(
                                    children: [
                                      ButtonTheme(
                                        height: 25,
                                        minWidth: 50,
                                        child: RaisedButton(
                                          child: Text("Accept", style: TextStyle(fontSize: 10)),
                                          onPressed: () {},
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.more_horiz)
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Text("Friends List", style: TextStyle(fontSize: 18)),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 3*50.0,
//                      width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemBuilder: (context, index)
                            {
                              return ListTile(
                                visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                                title: Text("Kelvin Baldwin"),
                                leading: Icon(Icons.email, size:30),
                                trailing: Container(
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Latest Catch: Tiendoornig...", style: TextStyle(fontSize: 10)),
                                      Text("FishDex: 40/64 (72%)", style: TextStyle(fontSize: 10)),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      )
    );
  }
}


class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x4437474F),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "Search here...",
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
  }
}

class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

  final FriendTile selectedItem;
  final VoidCallback deleteSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                selectedItem.name,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedItem,
          ),
        ],
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "No Items Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900].withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);

  final FriendTile item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        item.name,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

