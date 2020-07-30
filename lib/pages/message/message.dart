import 'package:flutter/material.dart';
import 'package:pat/app/components/message_item.dart';
import 'package:pat/app/models/message.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    List<Message> messages=[Message.empty(),Message("通知","https://njtechstas.top/resource/2020/7/18/adc4d69a-47c1-4a5b-8c6a-08ee98e2c59e.jpeg","您有一条通知消息")];
//    return Container();
    return Scaffold(
      body:Container(
        //如果没有请求数据则显示加载
        child: ListView.builder(
            //itemBuilder: messages.length,
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
                leading: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(messages[index].avatarUrl))),
                ),
              title: Text(messages[index].name),
              subtitle: Container(child: Text(messages[index].lastMessage),height: 20,),
            );
          },
        )

      ),

    );
  }
}
