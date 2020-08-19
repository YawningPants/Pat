import 'package:flutter/material.dart';
import 'file:///D:/Git/Flutter_App/pat/lib/pages/product/Product_bar.dart';
import 'package:pat/app/models/insurance.dart';
import 'package:pat/pages/product/ProductTabPage.dart';
import 'package:pat/pages/product/ShaiXuan/ShaiXuanUtil.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPagePageState createState() => _ProductPagePageState();
}

class _ProductPagePageState extends State<ProductPage> {
  //List<String> itemNames=["全部","责任险","意外险","医疗险"];
  List typeList =[
    {
      "title": "全部",
      "type":0,
    },
    {
      "title": "责任险",
      "type":1
    },
    {
      "title": "意外险",
      "type":2
    },
    {
      "title": "医疗险",
      "type":3
    },
  ];

  List insList=List();
  int insIndex=0;

  //Product_bar改变后更新insIndex
  void _handleIndIndexChanged(int newValue)
  {
    setState(() {
      insIndex=newValue;
    });
//    print("insIndex改为$insIndex");
  }

  //获取insList
  void getInsList()
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
        "https://m.sinosafe.com.cn/micro-plat/app/policy-common-comp-page.html?productId=P041204&isMulti=1&salesCode=108052213&issueChannel=2&SALE_COUNT=51&share=zhanye-app-share&from=singlemessage"
    ));

    sortInsList();
  }
  void sortInsList()
  {
    if(ShaiXuanUtil.shaixuanType==0)
      return;
    if(ShaiXuanUtil.shaixuanType==1)//价格从低到高
      insList.sort((left,right)=>left.price.compareTo(right.price));
    else if(ShaiXuanUtil.shaixuanType==2)//价格从高到低
      insList.sort((left,right)=>right.price.compareTo(left.price));
    else if(ShaiXuanUtil.shaixuanType==3)
      insList.sort((left,right)=>right.salesVol.compareTo(left.salesVol));
    return;
  }



  @override
  Widget build(BuildContext context) {
    getInsList();
    return Scaffold(
      appBar:buildAppBar(),
      body: ProductTabPage(
        insList: insList,
        insType: insIndex,
      ),

//      body: Center(
//        child:Text("${insList[1].name}")
//      ),
    );



  }

  Widget buildAppBar(){
    return PreferredSize(
      child: AppBar(
        title: ProductBar(
          formList: typeList,
          groupValueChanged: _handleIndIndexChanged,
        ),
      ),
      preferredSize: Size.fromHeight(65),
    );
  }
}


  
