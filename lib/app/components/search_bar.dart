import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SearchBar extends StatefulWidget {
  final bool editable;

  SearchBar({Key key, this.editable}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.09),
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.centerLeft,
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        child: Row(
          children: [
            Icon(
              FontAwesome.search,
              size: 17,
              color: Colors.black54,
            ),
            SizedBox(width: 5),
            buildTextField(),
          ],
        ),
      ),
    );
  }

  Widget buildTextField() {
    return Expanded(
      child: TextField(
        enabled: widget.editable,
        controller: textController,
        autofocus: true,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        ),
        cursorColor: Theme.of(context).primaryIconTheme.color,
        cursorWidth: 1,
        cursorRadius: Radius.circular(5),
        style: TextStyle(
          color: Theme.of(context).primaryIconTheme.color,
          fontSize: 14.5,
        ),
        onSubmitted: (text) {},
        onChanged: (text) {},
      ),
    );
  }
}
