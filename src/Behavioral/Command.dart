import '../example.dart';

// 最终负责处理的实体 (Receiver) (主厨)
class Bulb {
  String turnOn() => "Bulb has been lit.";
  String turnOff() => "Darkness!";
}

// Client 只需设置好 Command 丢给 Invoker 即可
abstract class BulbCommand {
  String execute();
  String undo();
  String redo();
}

// 为指令挑选负责执行的人，类似遥控器，接线员 Invoker (服务生)
class BulbRemoteControl {
  String submit(BulbCommand command) => command.execute();
  String undo(BulbCommand command) => command.undo();
  String redo(BulbCommand command) => command.redo();
}

// 一些BulbCommand，粘合 command 和执行 command 的人
class TurnOn implements BulbCommand {
  Bulb bulb;
  TurnOn(this.bulb);

  @override
  // 执行的是 turnOn() 方法
  String execute() => bulb.turnOn();

  @override
  String redo() => execute();

  @override
  String undo() => bulb.turnOff();
}

class TurnOff implements BulbCommand {
  Bulb bulb;
  TurnOff(this.bulb);

  @override
  // 执行的是 turnOff() 方法
  String execute() => bulb.turnOff();

  @override
  String redo() => execute();

  @override
  String undo() => bulb.turnOn();
}


class Command extends Example {
  Command([String filePath = "src/Behavioral/Command.dart"]) : super(filePath);

  @override
  String testRun() {
    Bulb bulb = Bulb(); //命令执行者
    BulbCommand turnOn = TurnOn(bulb); //解析命令1
    BulbCommand turnOff = TurnOff(bulb); //解析命令2

    //此处抽象出来一层 controler 用来控制 command 的执行/暂停/反转/撤销等
    BulbRemoteControl control = BulbRemoteControl();

    return """
    ${control.submit(turnOn)}
    ${control.undo(turnOn)}
    ${control.submit(turnOff)}
    """;

    // Command👇👇👇
    // Bulb has been lit.
    // Darkness!
    // Darkness!
  }
}

