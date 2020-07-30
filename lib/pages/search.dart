import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../app/components/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: Icon(AntDesign.left),
          onTap: Navigator.of(context).pop,
        ),
        title: Hero(
          tag: "search_bar",
          child: SearchBar(editable: true),
        ),
      ),
      body: Container(),
    );
  }
}
