import '../example.dart';

// 抽象类
abstract class Interviewer {
  String askQuestions();
}

// 实现askQuestions行为的子类1
class CommunityExecutive extends Interviewer {
  @override
  String askQuestions() {
    return 'What is Community Building ?';
  }
}

// 实现askQuestions行为的子类2
class Developer extends Interviewer {
  @override
  String askQuestions() {
    return 'What is Design Pattern ?';
  }
}

// 工厂manager，将Interviewer实例创建方法交给子类实现
abstract class HiringManager {
  Interviewer _makeInterviewer();

  String takeInterview() {
    var interviewer = _makeInterviewer();
    return interviewer.askQuestions();
  }
}

// 生产Developer的manager
class DevelopmentManager extends HiringManager {
  @override
  Interviewer _makeInterviewer() {
    return Developer();
  }
}

// 生产CommunityExecutive的manager
class MarketingManager extends HiringManager {
  @override
  Interviewer _makeInterviewer() {
    return CommunityExecutive();
  }
}

class FactoryMethod extends Example {
  FactoryMethod([String filePath = "src/Creational/FactoryMethod.dart"])
      : super(filePath);

  @override
  String testRun() {
    var devManager = DevelopmentManager();
    var makManager = MarketingManager();

    return """
    // Create a development manager.
    ${devManager.takeInterview()}
    
    // Create a marketing manager.
    ${makManager.takeInterview()}
    """;

    // FactoryMethod👇👇👇
    // // Create a development manager.
    // What is Design Pattern ?
    
    // // Create a marketing manager.
    // What is Community Building ?
  }
}
