import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pat/app/utils/font.dart';



class ProductBar extends StatefulWidget{

  ProductBar({Key key,this.formList:null,@required this.groupValueChanged});
  final List formList;
  final ValueChanged<int>groupValueChanged;

  @override
  _ProductBarState createState() =>_ProductBarState();

  
}


class _ProductBarState extends State<ProductBar>{
  int groupValue=0;
  @override
  Widget build(BuildContext context) {
    return
      GridView.count(
                  padding: EdgeInsets.all(10.0),
                  //一行多少个
                  crossAxisCount: 4,
                  //滚动方向
                  scrollDirection: Axis.vertical,
                  // 左右间隔
                  crossAxisSpacing: 5.0,
                  // 上下间隔
                 // mainAxisSpacing: 15.0,
                  //宽高比
                  childAspectRatio: 1 / 0.4,
                  shrinkWrap: true,
                  children: widget.formList.map((value) {
                    return listitem(context,value);
                  }).toList(),
                );

  }

  Widget listitem(context,value) {
    //var deviceSize = MediaQuery.of(context).size;
    //print(value['type']);
    return groupValue==value['type'] ? RaisedButton(
      shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      color: Colors.lightBlueAccent,
      onPressed: (){
        //print('切换${value}');
        updateGroupValue(value['type']);
      },
      child: Text(value['title'],style: FontUtil.normalTextStyle.copyWith(fontSize: 12),),
    ):OutlineButton(
      shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      onPressed: (){
//        print('切换${value}');
        updateGroupValue(value['type']);
      },
      child: Text(value['title'],style: FontUtil.normalTextStyle.copyWith(fontSize: 12),),
    );
  }

  void updateGroupValue(int v){
    setState(() {
      groupValue=v;
      widget.groupValueChanged(v);
    });
    //print("切换$groupValue");

  }
  
}

