import '../example.dart';

// 创建一个 Memento 用来记忆输入内容
class EditorMemento {
  String _content;

  EditorMemento(this._content);
}

// editor 可以使用 memento 存档或复原
class Editor {
  String _content = "";

  void type(String content) => _content += '\n' + content;

  EditorMemento save() => EditorMemento(_content);

  String restore(EditorMemento memento) => _content = memento._content;
}

class Memento extends Example {
  Memento([String filePath = "src/Behavioral/Memento.dart"]) : super(filePath);

  @override
  String testRun() {
    Editor editor = Editor();

    // 打两行字然后存档
    editor.type("First Line.");
    editor.type("Second Line.");
    var saved = editor.save();

    // 现在不小心碰到键盘了，想要复原
    editor.type("AAAAAAAAAAAAAAAAAAAAAAAAA");
    editor.restore(saved);

    return editor._content;

    // Memento👇👇👇

    // First Line.
    // Second Line.
  }
}
