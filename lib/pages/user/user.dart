import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pat/app/models/user.dart';
import 'package:pat/app/utils/navigator.dart';
import 'package:pat/pages/user/about_app.dart';

import '../../app/utils/font.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: buildUserProfilePanel(User.empty()),
          ),
          Positioned(
            bottom: 0,
            child: buildBody(),
          ),
        ],
      ),
    );
  }

  Widget buildUserProfilePanel(User user) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Stack(
        children: [
          /// 背景图片
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              user.bg,
              fit: BoxFit.cover,
            ),
          ),

          /// 背景图遮罩
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          /// 用户简介
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.top * 2,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: Image.network(user.avatarUrl),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.nickname,
                      style: FontUtil.h2Style.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                AntDesign.Safety,
                                size: 16,
                                color: Colors.green,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2.5),
                                child: Text(
                                  "${user.id - 1999}",
                                  style: FontUtil.normalTextStyle.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color:
                            user.isAdmin == 1 ? Colors.green : Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            user.isAdmin == 1 ? "管理员" : "用户",
                            style: FontUtil.normalTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    Widget buildUserProfileCount({
      String name,
      int count,
      void Function() onTap,
    }) {
      return Material(
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: [
                Text(
                  name,
                  style: FontUtil.normalTextStyle,
                ),
                Text(
                  count.toString(),
                  style: FontUtil.normalTextStyle,
                ),
              ],
            ),
          ),
          onTap: onTap ?? () {},
        ),
      );
    }

    Widget buildOptionListTiles() {
      return Expanded(
        child: Material(
          color: Colors.transparent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: Icon(
                  AntDesign.profile,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("我的保险"),
              ),
              ListTile(
                leading: Icon(
                  AntDesign.notification,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("系统通知"),
              ),
              ListTile(
                leading: Icon(
                  AntDesign.staro,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("我的收藏"),
              ),
              ListTile(
                leading: Icon(
                  AntDesign.clockcircleo,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("浏览记录"),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  AntDesign.user,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("账号"),
              ),
              ListTile(
                leading: Icon(
                  AntDesign.creditcard,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("付款方式"),
              ),
              ListTile(
                leading: Icon(
                  AntDesign.setting,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("应用设置"),
              ),
              ListTile(
                leading: Icon(
                  AntDesign.infocirlceo,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("关于应用"),
                onTap: () => NavigatorUtil.goToPage(
                  context: context,
                  page: AboutAppPage(),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height - 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildUserProfileCount(
                    name: "我的保险",
                    count: 0,
                  ),
                  buildUserProfileCount(
                    name: "系统通知",
                    count: 0,
                  ),
                  buildUserProfileCount(
                    name: "我的收藏",
                    count: 0,
                  ),
                  buildUserProfileCount(
                    name: "浏览记录",
                    count: 0,
                  ),
                ],
              ),
              Divider(),
              buildOptionListTiles(),
            ],
          )
    );
  }
}
