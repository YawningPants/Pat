import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pat/app/components/search_bar.dart';
import 'package:pat/app/utils/font.dart';
import 'package:pat/pages/product/Product.dart';
import 'package:pat/pages/message/message.dart';
import 'package:pat/pages/search.dart';
import 'package:pat/pages/home/home.dart';
import 'package:pat/pages/user/user.dart';

class FrameworkPage extends StatefulWidget {
  @override
  _FrameworkPageState createState() => _FrameworkPageState();
}

class _FrameworkPageState extends State<FrameworkPage> {
  int pageIndex = 0;
  static const List<String> pageTitle = ["主页","产品","消息"] ;

//  pageTitle.add("主页");
//  pageTitle.add("产品");
//  pageTitle.add("消息");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildPages(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildAppBar() {
    if (pageIndex == 3) return null;
    return AppBar(
      elevation: 0.5,
      centerTitle: true,
      leading: Container(
        alignment: Alignment.center,
        child:  Text(
            pageTitle[pageIndex],
            style:FontUtil.h2Style.copyWith(color: Colors.black)
        ),
      ),
      title:GestureDetector(
        child: Hero(
          tag: "search_bar",
          child: SearchBar(editable: false),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SearchPage(),
          ),
        ),
      ),
    );
  }

  Widget buildPages() {
    return IndexedStack(
      index: pageIndex,
      children: [
        HomePage(),
        ProductPage(),
        MessagePage(),
        UserProfilePage(),
      ],
    );
  }

  Widget buildBottomNavigationBar() {

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).accentColor,
        selectedLabelStyle: FontUtil.normalTextStyle.copyWith(
          fontSize: 13.5,
        ),
        unselectedLabelStyle: FontUtil.normalTextStyle.copyWith(
          fontSize: 13.5,
        ),
        onTap: (index) => setState(() => pageIndex = index),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(AntDesign.home),
            title: Text("主页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(AntDesign.bank),
            title: Text("产品"),
          ),
          BottomNavigationBarItem(
            icon: Icon(AntDesign.message1),
            title: Text("消息"),
          ),
          BottomNavigationBarItem(
            icon: Icon(AntDesign.user),
            title: Text("我的"),
          ),
        ],
      ),
    );
  }
}

