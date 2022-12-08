import 'dart:collection';

import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget  {
  final LinkedHashMap<String?, List<String>?> citiesList;
  final Function changeList;
  const CustomDrawer({
    Key? key,
    required this.citiesList,
    required this.changeList,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  TextEditingController editingController = TextEditingController();
  LinkedHashMap<String?, List<String>?> duplicate = LinkedHashMap();

  void filterSearchResults(String query) {
    LinkedHashMap<String?, List<String>?> dummySearchList = LinkedHashMap();
    dummySearchList.addAll(widget.citiesList);
    LinkedHashMap<String?, List<String>?> dummyListData = LinkedHashMap();

    if (query.isNotEmpty) {
      dummySearchList.forEach((key, value) {
        if (key!.contains(query)) {
          dummyListData.addAll({key: value});
        }
      });
    }

    setState(() {
      duplicate.clear();
      duplicate.addAll(dummyListData);
    });
  }

  Widget listTile() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: duplicate.length,
        itemBuilder: (
          context,
          index,
        ) {
          return ListTile(
            title: Text('${duplicate.keys.elementAt(index)}'),
            onTap: () {
              widget.changeList('${duplicate.keys.elementAt(index)}');
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: 400,
            child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(6, 57, 112, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Search a country",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      style: const TextStyle(color: Colors.white),
                      controller: editingController,
                      decoration: const InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ),
                  ],
                )),
          ),
          listTile(),
        ],
      ),
    );
  }
}
