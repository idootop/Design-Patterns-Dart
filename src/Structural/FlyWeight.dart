import '../example.dart';

class Tea {}

// 利用类似 factory 方式存储 Tea 的 cache 减少内存占用
class TeaMaker {
  Map<String, Tea> availableTea = {};

  Tea make(String teaPreference) {
    //把所有的Tea缓存到availableTea表中，节约内存
    // teaMaker 在 makeTea 时先去找是否已有做好（缓存）的 tea 
    if (availableTea[teaPreference] == null) {
      availableTea[teaPreference] = Tea();
    }
    return availableTea[teaPreference];
  }
}

// TeaShop依赖一个已经创建的TeaMaker，因为现在tea是缓存在TeaMaker手上的
// 不过可以考虑把tea缓存在teashop内会更好一些，并在初始化teashop时新建TeaMaker
class TeaShop {
  List<Tea> orders = List.filled(10, null);
  TeaMaker _teaMaker;

  TeaShop(this._teaMaker);

  void takeOrder(String teaType, int index) {
    //会把TeaMaker做好的tea记录到订单列表
    orders[index] = _teaMaker.make(teaType);
  }

  //提供订单里所有做好的茶
  String serve() {
    String ordersResult = "";

    orders.forEach((tea) {
      if (tea != null) {
        ordersResult += "Serving tea to table #${orders.indexOf(tea)}\n";
      }
    });

    return ordersResult;
  }
}


class FlyWeight extends Example {
  FlyWeight([String filePath = "src/Structural/FlyWeight.dart"])
      : super(filePath);

  @override
  String testRun() {
    TeaMaker teaMaker = TeaMaker();
    TeaShop shop = TeaShop(teaMaker);

    shop.takeOrder("less sugar", 1);
    shop.takeOrder("less ice", 2);
    shop.takeOrder("add milk", 5);

    return shop.serve();

    // FlyWeight👇👇👇
    // Serving tea to table #1
    // Serving tea to table #2
    // Serving tea to table #5
  }
}
