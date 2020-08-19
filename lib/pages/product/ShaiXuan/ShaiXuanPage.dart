
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pat/app/utils/font.dart';
import 'package:pat/pages/product/ShaiXuan/ShaiXuanUtil.dart';

class ShaiXuanPage extends StatelessWidget{
  int groupValue=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("筛选&排序",style: FontUtil.h2Style.copyWith(color: Colors.black),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(""),
          Text("  筛选&排序",style: FontUtil.normalTextStyle.copyWith(fontSize: 15),),
          Container(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("价格从低到高",style: FontUtil.normalTextStyle,),
                  onPressed: ()=>{
                    ShaiXuanUtil.shaixuanType=1,
                    Navigator.of(context).pop(context)},
                ),
                Container(
                  width: 8,
                ),
                RaisedButton(
                  child: Text("价格从高到低",style: FontUtil.normalTextStyle,),
                  onPressed: ()=>{
                    ShaiXuanUtil.shaixuanType=2,
                    Navigator.of(context).pop(context)},
                ),
                Container(
                  width: 8,
                ),
                RaisedButton(
                  child: Text("销量从高到低",style: FontUtil.normalTextStyle,),
                  onPressed: ()=>{
                    ShaiXuanUtil.shaixuanType=3,
                    Navigator.of(context).pop(context)},
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: RaisedButton(
                child: Text("重置",style: FontUtil.normalTextStyle,),
                onPressed: ()=>{
                  ShaiXuanUtil.shaixuanType=0,
                  Navigator.of(context).pop(context)},

              ),
            )
          )


        ],
      )
    );
  }

}