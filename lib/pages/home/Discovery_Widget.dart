import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pat/app/models/discovery.dart';
import 'package:pat/app/utils/font.dart';
import 'package:pat/pages/web_page/Web_Page.dart';

/*
 * Created by 李卓原 on 2018/9/13.
 * email: zhuoyuan93@gmail.com
 * https://blog.csdn.net/u011272795/article/details/82719640
 */

class DiscoveryWidget extends StatefulWidget {
  DiscoveryWidget({Key key}) : super(key: key);

  @override
  _DiscoveryWidget createState() => new _DiscoveryWidget();
}

class _DiscoveryWidget extends State<DiscoveryWidget> {
  List list = new List(); //列表要展示的数据
  ScrollController _scrollController = ScrollController(); //listview的控制器
  int _page = 1; //加载的页数
  bool isLoading = false; //是否正在加载数据

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getMore();
      }
    });
  }

//
//    初始化list数据 加延时模仿网络请求
//
  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        //list = List.generate(15, (i) => '哈喽,我是原始数据 $i');
        list=List.generate(20, (i) => Discovery(title: "爱宠珍藏馆|养宠小贴士（$i）"));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: RefreshIndicator(
        onRefresh: _onRefresh,
          child: ListView.builder(
            itemBuilder: _renderRow,
            itemCount: list.length + 1,
            controller: _scrollController,
          ),
        ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index < list.length) {
      return Container(
        height: 120,
        padding: EdgeInsets.only(
          top: 10,
          bottom: 5
        ),
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 120,
                  width: 150,
                  child: Image.asset(list[index].img),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(list[index].title,style: FontUtil.h2Style.copyWith(fontSize: 15),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
                    subtitle: Text(
                      list[index].subtitle,
                      style: FontUtil.h2Style.copyWith(fontSize: 12,color: Colors.black54),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child:FlatButton(
                onPressed: ()=>Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WebPage(
                        webUrl: list[index].webUrl,
                        webTitle: list[index].title,
                      ),
                    ),
                ),
              )
            )

          ],
        )


      );

    }
    return _getMoreWidget();
  }

  /**
   * 下拉刷新方法,为list重新赋值
   */
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
      setState(() {
//        list = List.generate(20, (i) => '哈喽,我是新刷新的 $i');
        list=List.generate(20, (i) => Discovery(title: "新 爱宠珍藏馆|养宠小贴士（$i）"));
      });
    });
  }


  /**
   * 上拉加载更多
   */
  Future _getMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        print('加载更多');
        setState(() {
//          list.addAll(List.generate(5, (i) => '第$_page次上拉来的数据'));
          list.addAll(List.generate(3, (i) => Discovery(title: "爱宠珍藏馆|养宠小贴士（${15+_page*3+i}）")));
          _page++;
          isLoading = false;
        });
      });
    }
  }

  /**
   * 加载更多时显示的组件,给用户提示
   */
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}