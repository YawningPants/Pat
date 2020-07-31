//此类用于生成各类产品列表

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:pat/app/components/Insurance_Card.dart';
import 'package:pat/app/models/insurance.dart';
import 'package:pat/app/utils/font.dart';


class ProductTabPage extends StatelessWidget{
  ProductTabPage({Key key,this.insType,this.insList}):super(key : key);
  final int insType;
  final List insList;

  void getusefulList(){
    if(insType != 0)
      insList.removeWhere((element) => element.type != insType);
  }
  @override
  Widget build(BuildContext context) {
    getusefulList();
    return insList.isEmpty?
        Center(
          child:Text("对不起，暂时没有您要找的保险",style: FontUtil.normalBoldTextStyle.copyWith(color: Colors.grey),) ,
//
        ):
        Container(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child:CardList(insList: insList,)
        );
  }

}



