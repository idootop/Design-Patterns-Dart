import '../example.dart';

// 把聊天室作为中介 Mediator
abstract class ChatRoomMediator {
  String showMessage(User user, String message);
}

class ChatRoom implements ChatRoomMediator {
  @override
  String showMessage(User user, String message) {
    String dateTime = DateTime.now().toLocal().toString();
    String sender = user._name;
    return "$dateTime [ $sender ]: $message";
  }
}

// 用户发消息时需经过 Mediator 的调用
// 即将不同的 user 实体等操作抽象到 Mediator 中去，在 Mediator 做聚合一些处理
class User {
  String _name;
  ChatRoomMediator _mediator;

  User(this._name, this._mediator);

  String send(String message) => _mediator.showMessage(this, message);
}


class Mediator extends Example {
  Mediator([String filePath = "src/Behavioral/Mediator.dart"])
      : super(filePath);

  @override
  String testRun() {
    ChatRoomMediator mediator = ChatRoom();
    User jay = User("Jay", mediator);
    User wei = User("Wei", mediator);

    return """
    ${jay.send("Hello !")}
    ${wei.send("Hi !")}
    """;

    // Mediator👇👇👇
    // 2020-11-25 09:17:19.070966 [ Jay ]: Hello !
    // 2020-11-25 09:17:19.073280 [ Wei ]: Hi !
  }
}
