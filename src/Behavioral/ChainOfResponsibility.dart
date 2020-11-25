import '../example.dart';

// 建立三个 Account 到 chain 中
abstract class Account {
  Account _successor;
  double _balance; //账户中现有的钱

  Account(this._balance);

  // 让用户可以自行调整 chain 中下一个 Account
  void setNext(Account next) {
    _successor = next;
  }

  String pay(double amountToPay) {
    if (canPay(amountToPay)) {
      // 当前账户有足够的钱（权限）去处理用户支付请求
      return "Paid $amountToPay using ${this.runtimeType.toString()}";
    } else if (_successor != null) {
      // 现在账户的钱不够，由用户指定的下一个账户去支付
      var reject =
          "Cannot pay using ${this.runtimeType.toString()}. Proceeding ... \n";
      reject += _successor.pay(amountToPay);
      return reject;
    } else {
      // 用户未再指定账户，调用结束
      return "None of the accounts have enough balance";
    }
  }

  // 检查当前账户能否支付（权限）
  bool canPay(double amountToPay) => _balance >= amountToPay;
}

class Bank extends Account {
  Bank(double balance) : super(balance);
}

class Paypal extends Account {
  Paypal(double balance) : super(balance);
}

class Bitcoin extends Account {
  Bitcoin(double balance) : super(balance);
}

class ChainOfResponsibility extends Example {
  ChainOfResponsibility(
      [String filePath = "src/Behavioral/ChainOfResponsibility.dart"])
      : super(filePath);

  @override
  String testRun() {
    // 添加一个 Account到 chain 中（chain即抽象类Account本身）
    Account bank = Bank(100); //100余额（权限/能力/责任）
    Account paypal = Paypal(200); //200余额
    Account bitcoin = Bitcoin(300); //300余额

    // 此处构建责任链
    bank.setNext(paypal);
    paypal.setNext(bitcoin);

    // ? 也可以考虑使用一个数组[]构建责任链
    // ? 即先将所有的 Account 按顺序加入到 chain 中，然后再依序调用构建成链

    // 从 chain 的第一个对象开始支付
    return bank.pay(259);

    // ChainOfResponsibility👇👇👇
    // Cannot pay using Bank. Proceeding ... 
    // Cannot pay using Paypal. Proceeding ... 
    // Paid 259.0 using Bitcoin
  }
}
