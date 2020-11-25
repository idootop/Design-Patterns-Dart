import '../example.dart';

// 抽象类
abstract class Door {
  String description();
}

// 木门
class WoodenDoor implements Door {
  @override
  String description() => "This is a wooden door.";
}

// 铁门
class IronDoor implements Door {
  @override
  String description() => "This is a iron door.";
}

// 维修工人
abstract class DoorExpert {
  String description();
  String fix();
}

// 木门维修工
class Carpenter extends DoorExpert {
  @override
  String description() => "I am a carpenter.";

  @override
  String fix() => "I am fixing wooden doors.";
}

// 铁门维修工
class Welder implements DoorExpert {
  @override
  String description() => "I am a welder.";

  @override
  String fix() => "I am fixing iron doors.";
}

// 创建一个工厂，将不同种类的门跟维修工对应起来
// 此处仅创建接口，具体由子类实现
abstract class DoorFactory {
  // 创建门
  Door makeDoor();
  // 召唤维修工
  DoorExpert callDoorExpert();
}

class WoodenDoorFactory implements DoorFactory {
  @override
  Door makeDoor() => WoodenDoor();

  @override
  DoorExpert callDoorExpert() => Carpenter();
}

class IronDoorFactory implements DoorFactory {
  @override
  Door makeDoor() => IronDoor();

  @override
  DoorExpert callDoorExpert() => Welder();
}


class AbstractFactory extends Example {
  AbstractFactory([String filePath = "src/Creational/AbstractFactory.dart"])
      : super(filePath);

  @override
  String testRun() {
    var woodenDoorFactory = WoodenDoorFactory();
    var woodenDoor = woodenDoorFactory.makeDoor();
    var carpenter = woodenDoorFactory.callDoorExpert();

    var ironDoorFactory = IronDoorFactory();
    var ironDoor = ironDoorFactory.makeDoor();
    var welder = ironDoorFactory.callDoorExpert();

    return """
    ${woodenDoor.description()}
    ${carpenter.description()}
    ${carpenter.fix()}
    ------
    ${ironDoor.description()}
    ${welder.description()}
    ${welder.fix()}
    """;

    // AbstractFactory👇👇👇
    // This is a wooden door.
    // I am a carpenter.
    // I am fixing wooden doors.
    // ------
    // This is a iron door.
    // I am a welder.
    // I am fixing iron doors.
  }
}
