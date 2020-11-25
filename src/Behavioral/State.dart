import '../example.dart';

// 写字时有三种状态，故抽象出状态层
abstract class WritingState {
  String write(String words);
}

// 默认写法
class DefaultText implements WritingState {
  @override
  String write(String words) => words;
}

// 大写
class UpperCase implements WritingState {
  @override
  String write(String words) => words.toUpperCase();
}

// 小写
class LowerCase implements WritingState {
  @override
  String write(String words) => words.toLowerCase();
}

// client 可随时变更状态，而不用去了解不同状态中的方法是怎样实现的
class TextEditor {
  // 绑定的状态
  WritingState _state;

  TextEditor(this._state);

  // 改变状态
  set state(WritingState value) {
    _state = value;
  }

  // 调用不同状态下的对应方法
  String type(String words) => _state.write(words);
}

class State extends Example {
  State([String filePath = "src/Behavioral/State.dart"]) : super(filePath);

  @override
  String testRun() {
    var editor = TextEditor(DefaultText());
    final r1 = editor.type("First Line.");

    editor.state = UpperCase();
    final r2 = editor.type("Second Line.");

    editor.state = LowerCase();
    final r3 = editor.type("Thrid Line.");

    return """
    $r1
    $r2
    $r3
    """;

    // State👇👇👇
    // First Line.
    // SECOND LINE.
    // thrid line.
    
  }
}

