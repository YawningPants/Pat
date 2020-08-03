import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pat/app/models/insurance.dart';
import 'package:pat/app/utils/font.dart';
import 'package:pat/pages/framework.dart';

import 'Recommend_Item.dart';

class RecommendWidget extends StatefulWidget{
  RecommendWidget({Key key,@required this.pageIndexChanged}):super(key : key);
  final ValueChanged<int>pageIndexChanged;
  @override
  _RecommendWidgetState createState() => _RecommendWidgetState();

}

class _RecommendWidgetState extends State<RecommendWidget>{
  List insList=List();
  List recList=List();

  void _handlePageIndexChanged(int newPageIndex){
    widget.pageIndexChanged(newPageIndex);
  }

  @override
  void initState() {
    super.initState();
    getInsList();
    _getRecList(2);
  }
  //获取保险数据
  void getInsList()async
  {
    insList.clear();
    insList.add(Insurance.empty());
    insList.add(Insurance(
        "汪星人意外医疗险",
        "assets/images/pet4.jpg",
        10,
        130.0,
        "宠物狗专项保障  意外诊疗或手术治疗",
        2,
        2,
        "https://m.inswin.cn/g123034/jiacai-baoxian/319096.shtml?from=singlemessage"
    ));
    insList.add(Insurance(
        "华安犬类宠物饲养人责任保险",
        "assets/images/pet3.jpg",
        51,
        50.0,
        "宠物狗专项保障  意外诊疗或手术治疗",
        1,
        3,
        "https://m.inswin.cn/g123034/jiacai-baoxian/319096.shtml?from=singlemessage",
    ));
  }

  //从保险数据中选取count个显示出来
  void _getRecList(int count)async{
    setState(() {
      insList.shuffle();
      recList.clear();
      for(int i = 0;i<count;i++)
        recList.add(insList[i]);
    });
    print("recList");
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 15,
          right: 15
        ),
        //color: Colors.grey,
        child:Column(


          children: <Widget>[
            //题头文字和按钮
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("为您推荐",style: FontUtil.normalBoldTextStyle.copyWith(fontSize: 18),),
                    Text("为您推荐以下几款保险产品",style: FontUtil.normalTextStyle.copyWith(fontSize: 12),)
                  ],
                ),


                Row(
                  children: <Widget>[
                    Container(
                      height: 18,
                      width: 60,
                      child:OutlineButton(
                        //icon: Icon(Icons.refresh,size: 18,),
                        //iconSize: 18,
                        child: Text("换一换",style: FontUtil.normalTextStyle.copyWith(fontSize: 8),),
                        //label: Text("换一换",style: FontUtil.normalTextStyle.copyWith(fontSize: 8),),
                        onPressed: ()=>
                        {
                          _getRecList(2)
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Container(
                      height: 15,
                      width: 50,
                      child:OutlineButton(
                          child: Text("更多",style: FontUtil.normalTextStyle.copyWith(fontSize: 8),),
                          onPressed: ()=>{
                            _handlePageIndexChanged(1),
                          }

                      ),
                    )

                  ],
                )
              ],
            ),

            //推荐条目
            RecommendItem(
              formList: recList,
            ),

          ],
        )

    );
  }

}