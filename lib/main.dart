void main() {
  int timeStamp=0;
  var map1=<int,String>{1:'neh',2:'majmudar'};
  print("Map created map1= $map1");

  var map2=Map.from(map1);
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Map created by .from method map2= $map2");
  });

  var map3=Map.of(map2);
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Map created by .of method map3= $map3");
  });

  List<int> nums=[1,2,3,4,5,6];
  Map<String,int> map4=Map.fromIterable(nums,key: (k)=>k.toString(),value: (v)=>v*v);
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Map created by .fromIterable map4= $map4");
  });

  List<String> str=['neh','majmudar'];
  List<int> num=[1,2];
  var map5=Map.fromIterables(str,num);
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Map created by .fromIterables map5= $map5");
  });

  map5['here']=4;
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Map value inserted without .putIfAbsent map5= $map5");
  });

  map5.putIfAbsent('is',()=>3);
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Map value inserted with .putIfAbsent map5= $map5");
  });

  var map6=<String,int>{'neh': 1,'majmudar':2};
  map6.addAll({'is':3,'here':4});
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Inserted values at the end with addAll map6= $map6");
  });

  var map7=<String,dynamic>{'hello':1,'neh':3};
  map7['neh']='world';
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Updated by applying brackets map7= $map7");
  });

  var map8=<dynamic,dynamic>{'hello':'neh',1:'world'};
  map8.update(1,(v){
    return 'majmudar';
  });
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Updated by update method map8= $map8");
  });

  var map9=<int,bool>{1:true,2:false,3:true,4:false};
  map9.updateAll((key,value)=>key%2==0?value=true:value=false);
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Updated by updateAll method map9= $map9");
  });

  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("map4.length= ${map4.length}");
    print("map4.keys= ${map4.keys}");
    print("map4.values= ${map4.values}");
    print("map4 empty? ${map4.isEmpty}");
    print("map4 contains key 2? ${map4.containsKey('2')}");
    print("map4 contains key 7? ${map4.containsKey('7')}");
    print("map4 contains value 36? ${map4.containsValue(36)}");
    print("map4 contains value 49? ${map4.containsKey(49)}");
  });

  var map10=<int,String>{1:'n',2:'e',3:'h'};
  var sortedmap10=Map.fromEntries(map10.entries.toList()..sort((e1,e2)=>e1.value.compareTo(e2.value)));
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("map10= $map10");
    print("sorted map10= $sortedmap10");
  });

  var map11=<int,String>{1:'hello',2:'world',3:'hi'};
  var keymap11=map11.keys.firstWhere((k)=>map11[k]=='hi');
  String temp="";
  map11.forEach((k,v){
    if(k==2){
      temp=v;
    }
  });
  Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
    print("Key of hi in map11= $keymap11");
    print("Value of 2 in map11= $temp");
  });

//   map4.remove(2);
//   map9.removeWhere((k,v)=>v=false);
//   map1.clear();
//   map2.clear();
//   map3.clear();
//   map4.clear();
//   map5.clear();
//   map6.clear();
//   map7.clear();
//   map8.clear();
//   map9.clear();
//   map10.clear();
//   map11.clear();
//   Future.delayed(Duration(seconds:(timeStamp=timeStamp+1)),(){
//     print("map1 empty? ${map1.isEmpty}");
//     print("map2 empty? ${map2.isEmpty}");
//     print("map3 empty? ${map3.isEmpty}");
//     print("map4 empty? ${map4.isEmpty}");
//     print("map5 empty? ${map5.isEmpty}");
//     print("map6 empty? ${map6.isEmpty}");
//     print("map7 empty? ${map7.isEmpty}");
//     print("map8 empty? ${map8.isEmpty}");
//     print("map9 empty? ${map9.isEmpty}");
//     print("map9 empty? ${map10.isEmpty}");
//     print("map9 empty? ${map11.isEmpty}");
//   });

}
