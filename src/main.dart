import 'Creational/SimpleFactory.dart';
import 'Creational/FactoryMethod.dart';
import 'Creational/AbstractFactory.dart';
import 'Creational/Builder.dart' as BuilderPattern;
import 'Creational/Prototype.dart';
import 'Creational/Singleton.dart';
import 'Structural/Adapter.dart';
import 'Structural/Bridge.dart';
import 'Structural/Composite.dart';
import 'Structural/Decorator.dart';
import 'Structural/Facade.dart';
import 'Structural/FlyWeight.dart';
import 'Structural/Proxy.dart';
import 'Behavioral/ChainOfResponsibility.dart';
import 'Behavioral/Command.dart';
import 'Behavioral/Iterator.dart';
import 'Behavioral/Mediator.dart';
import 'Behavioral/Memento.dart';
import 'Behavioral/Observer.dart';
import 'Behavioral/Visitor.dart';
import 'Behavioral/State.dart' as StatePattern;
import 'Behavioral/Strategy.dart';
import 'Behavioral/Template.dart';

void main() async {
  List patterns = [
    "Creational",
    SimpleFactory(), //简单工厂模式
    FactoryMethod(), //工厂模式
    AbstractFactory(), //抽象工厂模式
    BuilderPattern.Builder(), //建造者模式
    Prototype(), //原型模式
    Singleton(), //单例模式
    "Structural",
    Adapter(), //适配器模式
    Bridge(), //桥接模式
    Composite(), //组合模式
    Decorator(), //装饰器模式
    Facade(), //外观模式
    FlyWeight(), //享元模式
    Proxy(), //代理模式
    "Behavioral",
    ChainOfResponsibility(), //责任链模式
    Command(), //命令模式
    Iterator(), //迭代器模式
    Mediator(), //中介者模式
    Memento(), //备忘录模式
    Observer(), //观察者模式
    Visitor(), //访问者模式
    Strategy(), //策略模式
    StatePattern.State(), //状态模式
    Template(), //模版模式
  ];
  patterns.forEach((e) {
    if (e is String) {
      print('👉👉👉$e');
    } else {
      print(e.runtimeType.toString()+'👇👇👇');
      print(e.testRun());
    }
  });
}
