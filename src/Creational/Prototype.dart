import '../example.dart';

class Human {
  String _name;
  String _hairColor;

  Human(this._name, [this._hairColor = "black"]);
}

// Prototype继承（利用）已有对象Human
class Clone extends Human {
  //创建新的clone实体（利用super继承父类构造方法）
  Clone(Human human) : super(human._name, human._hairColor);
}

//所以子类继承父类也是一种Prototype，只不过Prototype可以是不同类的“继承”（克隆）
//或者说是利用已有对象，快速克隆类似对象的一种手段


class Prototype extends Example {
  Prototype([String filePath = "src/Creational/Prototype.dart"])
      : super(filePath);

  @override
  String testRun() {
    var original = Human("Jay");

    var clone = Clone(original);
    clone._name = "Wei";

    return """
    ${original._name} 's hair is ${original._hairColor}
    ${clone._name} 's hair is ${clone._hairColor}
    """;

    // Prototype👇👇👇
    // Jay 's hair is black
    // Wei 's hair is black
  }
}