import '../example.dart';

// 咖啡可以加料，加料要多价钱
abstract class Coffee {
  //抽象类
  double getCost();

  String getDescription();
}

// 原味咖啡，此为基础
class GeneralCoffee implements Coffee {
  //加一个基础，在此基础上扩展（可扩展性好）
  @override
  double getCost() => 5;

  @override
  String getDescription() => "Normal Coffee";
}

// 牛奶
class Milk implements Coffee {
  //原有coffe
  Coffee base;

  //在已有coffe实体的基础上继续修改coffee属性
  Milk(this.base);

  @override
  double getCost() => base.getCost() + 2;

  @override
  String getDescription() => base.getDescription() + ", Milk";
}

// 鮮奶油
class Whip implements Coffee {
  Coffee base;

  Whip(this.base);

  @override
  double getCost() => base.getCost() + 3;

  @override
  String getDescription() => base.getDescription() + ", Whip";
}

// 香草
class Vanilla implements Coffee {
  Coffee base;

  Vanilla(this.base);

  @override
  double getCost() => base.getCost() + 4;

  @override
  String getDescription() => base.getDescription() + ", Vanilla";
}

class Decorator extends Example {
  Decorator([String filePath = "src/Structural/Decorator.dart"])
      : super(filePath);

  @override
  String testRun() {
    // 第一杯我想要加牛奶就好
    Coffee coffee1 = GeneralCoffee();
    coffee1 = Milk(coffee1);

    // 第二杯我想要全加
    Coffee coffee2 = GeneralCoffee();
    coffee2 = Milk(coffee2);
    coffee2 = Whip(coffee2);
    coffee2 = Vanilla(coffee2);

    return """
    ${coffee1.getDescription()}
    Price : ${coffee1.getCost()}
    
    ${coffee2.getDescription()}
    Price: ${coffee2.getCost()}
    """;

    // Decorator👇👇👇
    // Normal Coffee, Milk
    // Price : 7.0
    
    // Normal Coffee, Milk, Whip, Vanilla
    // Price: 14.0
    
  }
}
