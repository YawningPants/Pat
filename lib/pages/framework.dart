//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pat/app/components/search_bar.dart';
import 'package:pat/app/utils/font.dart';
import 'package:pat/pages/home/Discovery_Widget.dart';
import 'package:pat/pages/product/Product.dart';
import 'package:pat/pages/message/message.dart';
import 'package:pat/pages/product/ShaiXuan/ShaiXuanPage.dart';
import 'package:pat/pages/search.dart';
import 'package:pat/pages/home/home.dart';
import 'package:pat/pages/user/user.dart';
import 'package:pat/pages/web_page/Web_Page.dart';


class FrameworkPage extends StatefulWidget {
  @override
  _FrameworkPageState createState() => _FrameworkPageState();
}



class _FrameworkPageState extends State<FrameworkPage> {
  int pageIndex = 0;
  static const List<String> pageTitle = ["主页","全部产品","消息"] ;
  void _handlePageIndexChanged(int newValue){
    setState(() {
      pageIndex=newValue;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildPages(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildAppBar() {
    if (pageIndex == 3 ) return null;
    if(pageIndex == 1){
      return AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          pageTitle[pageIndex],
          style:FontUtil.h2Style.copyWith(color: Colors.black),
        ),
        leading: GestureDetector(
          child: Hero(
            tag: "search_bar",
            child:Icon(
              FontAwesome.search,
              size: 17,
              color: Colors.black54,
            )
          ),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SearchPage(),
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child:
            Center(
//            padding: EdgeInsets.all(5.0),

                child:
//              Text("筛选    ",style: FontUtil.h2Style.copyWith(fontSize: 16))
                FlatButton(
                  child: Text("筛选",style: FontUtil.h2Style.copyWith(fontSize: 16)),
                  onPressed: ()async{
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ShaiXuanPage()
                      ),
                    );
                    setState(() {});
                  }
                )

            ),
          )

        ]
          );

    }
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
        HomePage(pageIndexChanged: _handlePageIndexChanged,),
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
            icon: Icon(Icons.pets),
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

  _waitPagePop(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ShaiXuanPage()
      ),
    );
//    setState;
  }
}

