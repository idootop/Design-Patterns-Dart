import '../example.dart';

class SingletonObject {
  //单例，使用 static 使其可在factory中调用
  static final SingletonObject _singleton = SingletonObject._();

  //工厂方法，生产单例
  factory SingletonObject() => _singleton;
  //or factory SingletonObject.getSingleton() => _singleton;

  //单例构造方法，需私有
  SingletonObject._() {
    //do something
  }
}

class Singleton extends Example {
  Singleton([String filePath = "src/Creational/Singleton.dart"])
      : super(filePath);

  var singleton1 = SingletonObject();
  var singleton2 = SingletonObject();

  @override
  String testRun() {
    return """
    ${singleton1 == singleton2}
    ${identical(singleton1, singleton2)}
    """;

    // Singleton👇👇👇
    // true
    // true
  }
}
