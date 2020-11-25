import '../example.dart';

// 同样是 sort method ，我们在不同情况可能会使用 merge sort ，或是用 quick sort
// 所以在此抽象出一层 sort 策略，来决定使用何种方法 sort
abstract class SortStrategy {
  String sort(List array);
}

class MergeSortStrategy implements SortStrategy {
  @override
  String sort(List array) => "Sort using merge sort";
}

class QuickSortStrategy implements SortStrategy {
  @override
  String sort(List array) => "Sort using quick sort";
}

// 策略模式可以动态决定使用何种 sort 方法
class Sorter {
  //绑定一种 sort 策略（下面对应了 sort 方法）
  SortStrategy _sorter;

  Sorter(this._sorter);

  String sort(List array) => _sorter.sort(array);
}

class Strategy extends Example {
  Strategy([String filePath = "src/Behavioral/Strategy.dart"])
      : super(filePath);

  @override
  String testRun() {
    // 用 MergeSortStrategy 初始化 Sorter
    Sorter sorter = Sorter(MergeSortStrategy());
    var result1 = sorter.sort([1, 2, 3]);
    // 更换策略为 QuickSortStrategy
    // ? 此处更优雅的方式是在 sorter 中添加 changeSortStrategy 但方法，动态更改策略
    sorter = Sorter(QuickSortStrategy());
    var result2 = sorter.sort([1, 2, 3]);

    return "$result1 \n$result2";

    // Strategy👇👇👇
    // Sort using merge sort 
    // Sort using quick sort

  }
}
