import '../example.dart';

// 抽象出员工公共属性
abstract class Employee {
  String name;
  String role;
  double salary;

  Employee(this.name, this.salary, [this.role]);
}

class Developer extends Employee {
  Developer(String name, double salary, [String role]) : super(name, salary);
}

class Designer extends Employee {
  Designer(String name, double salary, [String role]) : super(name, salary);
}

// 为了方便管理员工，将员工实体们统一放到 company 中进行管理
class Company {
  //所有员工
  List<Employee> _employees = [];

  void addEmployee(Employee employee) {
    _employees.add(employee);
  }

  double getNetSalaries() {
    return _employees
        .map((employee) => employee.salary) //转员工工资map
        .fold(0, (net, salary) => net + salary);
        //net：上一个value，salary：当前的工资
        //(net, salary) => net + salary <--> value = pre + now
  }
}

class Composite extends Example {
  Composite([String filePath = "src/Structural/Composite.dart"])
      : super(filePath);

  @override
  String testRun() {
    var jay = Developer("Jay Wang", 10000);
    var wei = Designer("Wei Chang", 1);

    var jayIsBetterCompany = Company();
    jayIsBetterCompany.addEmployee(jay);
    jayIsBetterCompany.addEmployee(wei);

    return " Net salary is ${jayIsBetterCompany.getNetSalaries()}";

    // Composite👇👇👇
    // Net salary is 10001.0

  }
}
