

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pat/app/models/insurance.dart';
import 'package:pat/app/utils/font.dart';
import 'package:pat/pages/web_page/Web_Page.dart';

class RecommendItem extends StatelessWidget{
  RecommendItem({Key key,@required this.formList}):super(key : key);
  final List formList;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(0),
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,

      //禁止滑动
      physics: new NeverScrollableScrollPhysics(),
      // 左右间隔
      crossAxisSpacing: 0.0,
      // 上下间隔
      // mainAxisSpacing: 15.0,
      //宽高比
      childAspectRatio: 1 / 0.6,
      shrinkWrap: true,
      children: formList.map((value) {
        return listitem(context,value);
      }).toList(),
    );
  }

  Widget listitem(context,Insurance value){
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 5,
        right: 5
      ),
      width: MediaQuery.of(context).size.width*0.95,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: <Widget>[
            //背景图
            Image.asset(value.bg,fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,),
            // 背景图遮罩
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.white.withOpacity(0.60),
              ),
            ),

            //保险简介
            Container(
              padding: EdgeInsets.only(
                top: 17,
                left: 15,
                right: 50
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(value.name,
                      style: FontUtil.h2Style.copyWith(fontSize: 16,color: Colors.black87),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                   // Text(""),

                    Text(value.introduce,
                    style: FontUtil.normalTextStyle.copyWith(fontSize: 12,color: Colors.black54),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,),

                    Text(""),
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                  text: "￥${value.price}",
                                  style: FontUtil.h2Style.copyWith(color: Colors.blueGrey,fontSize: 15)
                              ),
                              TextSpan(
                                text:" 起",
                                style: FontUtil.normalTextStyle.copyWith(fontSize: 12),
                              ),


                            ]
                        )
                    ),


                  ],
                )
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FlatButton(
                onPressed: ()=>Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WebPage(
                      webUrl: value.webUrl,
                      webTitle: value.name,
                    ),
                  ),
                ),
              ),
            )
          ],
        )

      ),
    );
  }

}