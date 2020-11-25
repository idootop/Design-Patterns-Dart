import '../example.dart';

// 会roar叫的狮子
class Lion {
  String roar() => "OH oh OH oh OH oh OHHH~";
}

// 现在猎人只捕猎roar叫的狮子
//（Hunter只依赖了Lion的roar方法）
class Hunter {
  String hunt(Lion lion) => lion.roar();
}

// 会moo叫的牛
class Cow {
  String moo() => "MOOooOoOoOoo~";
}

// CowAdapter可以把moo叫的牛转换成roar叫的“狮子”
// 这样猎人也可以捕牛了
class CowAdapter extends Lion {
  Cow cow;

  CowAdapter(this.cow);

  @override
  String roar() {
    return cow.moo();
  }
}

class Adapter extends Example {
  Adapter([String filePath = "src/Structural/Adapter.dart"]) : super(filePath);

  @override
  String testRun() {
    var hunter = Hunter();
    var lion = Lion();

    var cow = Cow();
    var cowAdapter = CowAdapter(cow);

    return """
    // Hunter is hunting the lion.
    ${hunter.hunt(lion)}
    
    // Now the hunter can hunt cows.
    ${hunter.hunt(cowAdapter)}
    """;

    // Adapter👇👇👇
    // // Hunter is hunting the lion.
    // OH oh OH oh OH oh OHHH~
    
    // // Now the hunter can hunt cows.
    // MOOooOoOoOoo~
  }
}
