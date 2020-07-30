class Message {
  String name="爱宠贝贝客服";
  String avatarUrl = 'https://njtechstas.top/resource/2020/7/18/6db340bc-6a5a-43b8-9cbe-f1999ea09281.jpg';
  String lastMessage="哈喽，这里有你的一份专属福利！";
  Message.empty();
  Message(String name,String avatarIrl,String lastMessage)
  {
    this.name=name;
    this.avatarUrl=avatarIrl;
    this.lastMessage=lastMessage;
  }

}