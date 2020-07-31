import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pat/app/models/message.dart';

class MessageItem extends StatefulWidget{

  MessageItem(Key key):super(key : key);

  @override
  _MessageItem createState() => _MessageItem();

}

class _MessageItem extends State<MessageItem>{
  Message message;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                //image: NetworkImage(_datas[index].imageUrl))),
               //Image.network(user.avatarUrl)
                image: NetworkImage(Message.empty().avatarUrl))),
      ),
      title: Text(Message.empty().name),
      subtitle: Container(child: Text(Message.empty().lastMessage),height: 20,),
    );
  }
  
}