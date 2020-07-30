import 'package:flutter/material.dart';
import 'package:pat/app/utils/font.dart';
import 'package:package_info/package_info.dart';

class AboutAppPage extends StatefulWidget {
  @override
  _AboutAppPageState createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关于此应用"),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, packageInfo) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              buildPoweredByLogo(),
              Divider(height: 0),
              ListTile(
                title: Text(
                  "应用名称",
                  style: FontUtil.normalTextStyle,
                ),
                subtitle: Text(
                  packageInfo.data.appName,
                  style: FontUtil.smallTextStyle,
                ),
                onTap: () {},
              ),
              Divider(height: 0),
              ListTile(
                title: Text(
                  "版本号",
                  style: FontUtil.normalTextStyle,
                ),
                subtitle: Text(
                  packageInfo.data.version,
                  style: FontUtil.smallTextStyle,
                ),
                trailing: Text(
                  "检测更新",
                  style: FontUtil.smallTextStyle,
                ),
                onTap: () {},
              ),
              Divider(height: 0),
              ListTile(
                title: Text(
                  "内部版本号",
                  style: FontUtil.normalTextStyle,
                ),
                subtitle: Text(
                  packageInfo.data.buildNumber,
                  style: FontUtil.smallTextStyle,
                ),
                onTap: () {},
              ),
              Divider(height: 0),
              ListTile(
                title: Text(
                  "特别鸣谢",
                  style: FontUtil.normalTextStyle,
                ),
                trailing: Text(
                  "查看",
                  style: FontUtil.smallTextStyle,
                ),
                onTap: showUrlListBottomSheet,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildPoweredByLogo() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "100% powered by",
                style: FontUtil.normalTextStyle,
              ),
              FlutterLogo(
                size: 70,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Flutter build beautiful native apps in record time",
            style: FontUtil.smallTextStyle,
          ),
        ],
      ),
    );
  }

  void showUrlListBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).cardColor,
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return ListView(
          padding: EdgeInsets.symmetric(vertical: 10),
          children: [
            ListTile(
              title: Text(
                "后端技术栈",
                style: FontUtil.h1Style,
              ),
            ),
            ListTile(
              isThreeLine: true,
              title: Text(
                "Golang",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "Golang makes it easy to build simple, reliable, and efficient software",
                style: FontUtil.smallTextStyle,
              ),
              trailing: Image.asset(
                "assets/images/golang.png",
                fit: BoxFit.cover,
              ),
              onTap: () {},
            ),
            ListTile(
              isThreeLine: true,
              title: Text(
                "Gin Web Framework",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "Gin features a martini-like API with performance that is up to 40 times faster thanks to httprouter",
                style: FontUtil.smallTextStyle,
              ),
              trailing: Image.asset(
                "assets/images/gin.png",
                fit: BoxFit.cover,
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text(
                "前端开源组件",
                style: FontUtil.h1Style,
              ),
            ),
            ListTile(
              title: Text(
                "draggable_scrollbar_sliver",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "列表滚动条",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "flutter_webview_plugin",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "WebView支持",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "responsive_builder",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "适应型布局",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "shared_preferences",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "应用缓存控制",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "flutter_screenutil",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "适应型布局",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "flutter_spinkit",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "漂亮的loading组件库",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "auto_orientation",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "屏幕旋转",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "marquee_widget",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "文字跑马灯",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "flutter_swiper",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "轮播图",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "flutter_icons",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "第三方图标库",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "package_info",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "APP本身信息获取 (版本号, 应用名称)",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "bot_toast",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "全局通知组件",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "sentry",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "flutter_sentry的依赖库",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "dio",
                style: FontUtil.normalTextStyle,
              ),
              subtitle: Text(
                "极其完善的网络库",
                style: FontUtil.smallTextStyle,
              ),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}
