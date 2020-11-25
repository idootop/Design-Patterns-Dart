import '../example.dart';

// 动物抽象类，可以通过 accept 拓展一些能力
abstract class Animal {
  String accept(AnimalOperation operation);
}

// 拓展其他动物的能力到所有动物类
abstract class AnimalOperation {
  //此处需要 visit 到所有的动物，方便后期拓展方法到所有动物
  String visitMonkey(Monkey monkey);

  String visitLion(Lion lion);

  String visitDolphin(Dolphin dolphin);
}

// 各种动物的基本 Class ，我们尽量不去动他
class Monkey implements Animal {
  String shout() => 'Ooh oo aa aa!';

  @override
  //他自身拓展的 accept 能力，来自它自身（this） 
  String accept(AnimalOperation operation) => operation.visitMonkey(this);
}

class Lion implements Animal {
  String roar() => 'Roaaar';

  @override
  String accept(AnimalOperation operation) => operation.visitLion(this);
}

class Dolphin implements Animal {
  String speak() => 'Tuut tuttu tuutt!';

  @override
  String accept(AnimalOperation operation) => operation.visitDolphin(this);
}

// 利用 AnimalOperation 制造动物类的 Speak 的 operation
// 即将 speak 方法拓展到动物类中每个动物身上
class Speak implements AnimalOperation {
  @override
  String visitMonkey(Monkey monkey) => monkey.shout();//猴子会shout

  @override
  String visitDolphin(Dolphin dolphin) => dolphin.speak();//海豚会speak

  @override
  String visitLion(Lion lion) => lion.roar();//狮子会roar
}

// 过了一段时间，又给动物们添加了 jump 的 operation
class Jump implements AnimalOperation {
  @override
  String visitDolphin(Dolphin dolphin) =>
      "Walked on water a little and disappeared";

  @override
  String visitLion(Lion lion) => 'Jumped 7 feet! Back on the ground!';

  @override
  String visitMonkey(Monkey monkey) => "Jumped 20 feet high! on to the tree!";
}

class Visitor extends Example {
  Visitor([String filePath = "src/Behavioral/Visitor.dart"]) : super(filePath);

  @override
  String testRun() {
    //一些动物
    Animal monkey = Monkey();
    Animal lion = Lion();
    Animal dolphin = Dolphin();

    // ? 但其实感觉这里的speak/jump方法只是判断不同的动物类分配不同的方法
    // ? 感觉swich一下动物类来给定不同动物的方法也OK，不晓得这样比visitor模式有何差别
    
    var speak = Speak();
    var jump = Jump();

    return """
    Monkey speak: ${speak.visitMonkey(monkey)}
    Dolphin speak: ${speak.visitDolphin(dolphin)}
    Lion jump: ${jump.visitLion(lion)}
    """;

    // Visitor👇👇👇
    // Monkey speak: Ooh oo aa aa!
    // Dolphin speak: Tuut tuttu tuutt!
    // Lion jump: Jumped 7 feet! Back on the ground!
    
  }
}
