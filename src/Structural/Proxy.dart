import '../example.dart';

abstract class Door {
  String open();

  String close();
}

// 现在此类中的方法是暴露的
// 我们需要用proxy去代理调用该类中的敏感方法，来保证调用是合法的
class LabDoor implements Door {
  @override
  String close() => "Lab door is closing!";

  @override
  String open() => "Lab door is opening!";
}

// 我们利用 SecuredDoor 来代理调用 labdoor 中的方法，保证其安全性（黑盒）
// 或者使用 proxy 代理实现（调用）其他类中的方法，整合不同类之间的调用过程
class SecuredDoor {
  Door door;

  SecuredDoor(this.door);

  String open(String password) {
    if (authenticate(password)) {
      return door.open();
    } else {
      return "YOU SHALL NOT PASS!";
    }
  }

  String close() => door.close();

  bool authenticate(String password) {
    return password == "abcdefg";
  }
}

class Proxy extends Example {
  Proxy([String filePath = "src/Structural/Proxy.dart"]) : super(filePath);

  @override
  String testRun() {
    Door labDoor = LabDoor();
    SecuredDoor securedDoor = SecuredDoor(labDoor);

    return """
    // Thief is trying to break the door but failed.
    ${securedDoor.open("123456")}
    
    // Teacher can open the door easily.
    ${securedDoor.open("abcdefg")}
    ${securedDoor.close()}
    """;

    // Proxy👇👇👇
    // // Thief is trying to break the door but failed.
    // YOU SHALL NOT PASS!
    
    // // Teacher can open the door easily.
    // Lab door is opening!
    // Lab door is closing!
  }
}
