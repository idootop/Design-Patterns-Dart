import '../example.dart';

// 抽象类
abstract class Door {
  double width;
  double height;

  Door(this.width, this.height);
}

// 子类实现抽象类
class WoodenDoor implements Door {
  double height;
  double width;

  WoodenDoor(this.width, this.height);
}

// 建立一个工厂创建实例
class DoorFactory {
  //提供实例生产方法
  static Door createDoor(double width, double height) {
    //隐藏实例生产逻辑
    return WoodenDoor(width, height);
  }
}

class SimpleFactory extends Example {
  SimpleFactory([String filePath = "src/Creational/SimpleFactory.dart"])
      : super(filePath);

  @override
  String testRun() {
    var door1 = DoorFactory.createDoor(100, 200);
    var door2 = DoorFactory.createDoor(50, 100);
    return """
    door1's width = 
    ${door1.width}
    
    door2's height = 
    ${door2.height}
    """;

    // SimpleFactory👇👇👇
    // door1's width = 
    // 100.0
    
    // door2's height = 
    // 100.0
  }
}
