import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pat/app/models/insurance.dart';
import 'package:pat/app/utils/font.dart';
import 'package:pat/pages/web_page/Web_Page.dart';

class InsCard extends StatelessWidget{
  InsCard({Key key,this.insurance}):super(key:key);
  final Insurance insurance;
  @override
  Widget build(BuildContext context) {
    if(insurance==null)
      return Container();

    var mycard = new SizedBox(
      height: 290.0,  //设置高度
      width: MediaQuery.of(context).size.width*0.95,
      child: new Card(
          elevation: 5.0,  //设置阴影
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),  //设置圆角
          child:
          new Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                child:buildInsPanel(context) ,
              ),
              Positioned(
                bottom: 15,
                child:buildInsButton(context),

              )
            ],

          )
      ),
    );

    return Container(
      // child: Text("${insurance.type}"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          mycard
        ],
      ),
    );
  }

  Widget buildInsPanel(BuildContext context){
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 190,
        child:Stack(
          children: <Widget>[
            //背景图片
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                  child:  Image.asset(insurance.bg,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,),
                ),
                //child:Image.network(insurance.bg,fit: BoxFit.cover,)
//                child:
//                Container(
//                  decoration: BoxDecoration(
//                    image:DecorationImage(
//                      image: AssetImage(insurance.bg),
//                      //NetworkImage(insurance.bg),
//                      fit: BoxFit.cover,
//                    ),
//                    borderRadius: BorderRadius.vertical(top:Radius.circular(4.0))//这里存在问题，只能设置左上角不能设置右上角
//
//                  ),
//
//                ),

            ),

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
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("销量:  ${insurance.salesVol}",style: FontUtil.normalBoldTextStyle.copyWith(color: Colors.black45,fontSize: 12,decoration: TextDecoration.underline),),
                    ),
                    ListTile(
                      title: Text(insurance.name,style: FontUtil.h2Style.copyWith(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                      subtitle: Text(insurance.introduce,style: FontUtil.normalTextStyle.copyWith(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
                    )

                  ],
                )
            ),

            //保险价格
            Positioned(
              left: 0 ,
              bottom: 0,
              right: 0,
              child: ListTile(
                title: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                              text: "￥${insurance.price}",
                              style: FontUtil.h2Style.copyWith(color: Colors.blueGrey)
                          ),
                          TextSpan(
                            text:"起",
                            style: FontUtil.normalTextStyle,
                          ),


                        ]
                    )
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child:FlatButton(
                onPressed: ()=>Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WebPage(
                      webUrl: insurance.webUrl,
                      webTitle: insurance.name,
                    )
                  ),
                ),
              ),
            )

          ],
        )
    );
  }

  //画出下方的按钮；
  //以后可能会增加保险特点简介
  Widget buildInsButton(BuildContext context){
    return
      Container(
        width: MediaQuery.of(context).size.width*0.8,
        height: 40,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*0.15
        ),


        child: RaisedButton(
          color: Colors.blue,
          child:
          Text("获取保障",style: FontUtil.h2Style.copyWith(color: Colors.white),),
          onPressed: ()=>Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WebPage(
                webUrl: insurance.webUrl,
                webTitle: insurance.name,
              ),
            ),
          ),
        ),
      )
    ;
  }

}

class CardList extends StatelessWidget{
  CardList({Key key,this.insList}):super(key : key);
  final List insList;
  Widget buildItem(BuildContext context,int index){
    return InsCard(
        insurance:insList[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
//      padding: EdgeInsets.all(10),
      itemExtent: 305.0,
      itemCount: insList.length,
      itemBuilder: buildItem,
    );
  }
  
}