import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//参考自 https://www.cnblogs.com/zhangqie/p/10882364.html
//用来显示网页
class WebPage extends StatelessWidget {
  WebPage({Key key,this.webUrl:"https://blog.csdn.net/dickyqie",this.webTitle:""}):super(key : key);
  String webUrl;
  String webTitle;
  @override
  Widget build(BuildContext context) {
    List<Widget> titleContent = [];
    titleContent.add(new Text(
      webTitle,
      style: new TextStyle(color: Colors.black54),
    ));
    titleContent.add(new Container(width: 50.0));
    // WebviewScaffold是插件提供的组件，用于在页面上显示一个WebView并加载URL
    return new WebviewScaffold(
      url: webUrl,
      // 登录的URL
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      withZoom: true,
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }
}