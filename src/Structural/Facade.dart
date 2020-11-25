import '../example.dart';

// 计算机底层api，供调用
class Computer {
  String getElectricShock() => "Ouch!";

  String makeSound() => "Beep beep!";

  String showLoadingScreen() => "Loading...";

  String bam() => "Ready to be used!";

  String closeEverything() => "Bup bup bup buzzzz!";

  String sooth() => "ZZzzz";

  String pullCurrent() => "Haaah!";
}

// 高阶计算机操作类，封装低阶接口调用过程，方便使用
class ComputerFacade {
  Computer computer;

  ComputerFacade(this.computer);

  String turnOn() => """
${computer.getElectricShock()}
${computer.makeSound()}
${computer.showLoadingScreen()}
${computer.bam()}
    """;

  String turnOff() => """
${computer.closeEverything()}
${computer.pullCurrent()}
${computer.sooth()}
  """;
}


class Facade extends Example {
  Facade([String filePath = "src/Structural/Facade.dart"]) : super(filePath);

  @override
  String testRun() {
    Computer computer = Computer();
    ComputerFacade facade = ComputerFacade(computer);

    return """
// Now turn on the computer.
${facade.turnOn()}
    
// Turn off the computer.
${facade.turnOff()}
    """;

    // Facade👇👇👇
    // // Now turn on the computer.
    // Ouch!
    // Beep beep!
    // Loading...
    // Ready to be used!
        
        
    // // Turn off the computer.
    // Bup bup bup buzzzz!
    // Haaah!
    // ZZzzz
  }
}