

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pat/app/models/insurance.dart';
import 'package:pat/app/utils/font.dart';
import 'package:pat/main.dart';
import 'package:pat/pages/home/Carousel.dart';
import 'package:pat/pages/home/Discovery_Widget.dart';
import 'package:pat/pages/home/Rceommend_Widget.dart';
import 'package:pat/pages/home/Recommend_Item.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key,@required this.pageIndexChanged}):super(key : key);
  final ValueChanged<int>pageIndexChanged;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _handlePageIndexChanged(int newPageIndex){
    widget.pageIndexChanged(newPageIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildCarousel(),
          buildButtons(),
          buildRecommend(),
          buildDiscovery()
        ],
      ),
    );
  }

  //轮播图
  Widget buildCarousel() {
    return Carousel();
  }

  //四个按钮
  Widget buildButtons(){
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 15,
        right: 3,
        bottom: 10
      ),
      height: 120,
      //color: Colors.grey,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //按钮1
          Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/icons/vet.png",width: MediaQuery.of(context).size.width/6,),
                  //Icon(Icons.pan_tool,size: 60,),
                  Text("在线投保",style: FontUtil.normalTextStyle,),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
//                width: 80,
                child: FlatButton(
                  child:Container(),
                  onPressed: ()=>{
                    _handlePageIndexChanged(1),
                  },
                ),
              )
            ],
          ),

          //按钮2
          Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/icons/dog-food.png",width: MediaQuery.of(context).size.width/6),
                  //Icon(Icons.pan_tool,size: 60,),
                  Text("保单查询",style: FontUtil.normalTextStyle,),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
//                width: 80,
                child: FlatButton(
                  child:Container(),
                  onPressed: ()=>{
                    _handlePageIndexChanged(3),
                  },
                ),
              )
            ],
          ),

        //按钮3
          Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/icons/dog (1).png",width: MediaQuery.of(context).size.width/6),
                  //Icon(Icons.pan_tool,size: 60,),
                  Text("定制保险",style: FontUtil.normalTextStyle,),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
//                width: 80,
                child: FlatButton(
                  child:Container(),
                  onPressed: ()=>{
                    _handlePageIndexChanged(1),
                  },
                ),
              )
            ],
          ),

          //按钮4
          Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/icons/call.png",width: MediaQuery.of(context).size.width/6),
                  //Icon(Icons.pan_tool,size: 60,),
                  Text("在线客服",style: FontUtil.normalTextStyle,),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
//                width: 80,
                child: FlatButton(
                  child:Container(),
                  onPressed: ()=>{
                    _handlePageIndexChanged(2),
                  },
                ),
              )
            ],
          ),
        ],
      )

    );
  }

  //为您推荐
  Widget buildRecommend(){
    return RecommendWidget(pageIndexChanged: _handlePageIndexChanged,);
  }

  //发现
  Widget buildDiscovery(){
    return
    Container(
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 15,
        right: 20
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("发现",style: FontUtil.normalBoldTextStyle.copyWith(fontSize: 18),),
                  Text("关于毛孩子，一切都在这里",style: FontUtil.normalTextStyle.copyWith(fontSize: 12),)
                ],
              )
            ],
          ),
          Container(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.arrow_drop_up)
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.7,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(0),
            child: DiscoveryWidget(),
          ),

        ],
      ),
    );

  }

}
