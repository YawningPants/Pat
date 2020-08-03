class Insurance{
  String name="太平科技宠物险";
  //String bg='https://njtechstas.top/resource/2020/7/18/adc4d69a-47c1-4a5b-8c6a-08ee98e2c59e.jpeg';
  String bg="assets/images/pet1.jpg";
  int salesVol=79;//销量
  double price=29.9;
  String introduce="保障被宠物袭击的第三者";
  int type=1;//保险类型 1责任险 2意外险 3医疗险
  int id=0;//保险的内部编号
  String webUrl="https://m.inswin.cn/g123034/jiacai-baoxian/319096.shtml?from=singlemessage";
  Insurance.empty();
  Insurance(String name,String bg,int salesVol,double price,String introduce,int type,int id,String webUrl){
    this.name=name;
    this.bg=bg;
    this.salesVol=salesVol;
    this.price=price;
    this.introduce=introduce;
    this.type=type;
    this.id=id;
    this.webUrl=webUrl;
  }

}