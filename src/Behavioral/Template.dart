import '../example.dart';

// 抽象出不变的模版 (骨架)
abstract class Builder {
  String build() {
    return "${test()}\n${lint()}\n${assemble()}\n${deploy()}";
  }

  String test();

  String lint();

  String assemble();

  String deploy();
}

// 根据模版，修改不同的样式细节（实现方法）
class AndroidBuilder extends Builder {
  @override
  String test() => 'Running android tests';

  @override
  String lint() => 'Linting the android code';

  @override
  String assemble() => 'Assembling the android build';

  @override
  String deploy() => 'Deploying android build to server';
}

// 根据模版，修改不同的样式细节（实现方法）
class IosBuilder extends Builder {
  @override
  String test() => 'Running iOS tests';

  @override
  String lint() => 'Linting the iOS code';

  @override
  String assemble() => 'Assembling the iOS build';

  @override
  String deploy() => 'Deploying iOS build to server';
}


class Template extends Example {
  Template([String filePath = "src/Behavioral/Template.dart"])
      : super(filePath);

  @override
  String testRun() {
    var androidBuilder = AndroidBuilder();
    var iosBuilder = IosBuilder();

    return androidBuilder.build() + "\n\n" + iosBuilder.build();

    // Template👇👇👇
    // Running android tests
    // Linting the android code
    // Assembling the android build
    // Deploying android build to server

    // Running iOS tests
    // Linting the iOS code
    // Assembling the iOS build
    // Deploying iOS build to server
  }
}
