# 设计模式(Dart版)

## 三类设计模式

|分类|特点|例子|
| ------   | -----  | ---- |
|[Creational Design Pattern](#种类一-Creational-Design-Pattern)|注重如何初始化一个或一群实体。|Factory, Builder, Prototype, Singleton, ...|
|[Structural Design Pattern](#种类二-Structural-Design-Pattern)|注重实体之间互相「组合」取代「继承」。|Decorator, Adapter, Composite, Facade, Proxy, ...|
|[Behavioral Design Pattern](#种类三-Behavioral-Design-Pattern)|注重分配每个实体的功能，建立联系沟通。|Strategy, Observer, State, Command, Iterator, Template, ...|


## 六大设计原则

### SOLID 原则

* 单一职责原则 (Single responsibility principle, SRP)

  每个实体，不管是 class 还是 function，其功能都应该专注于一件事上。

  同时做两件以上的事情，不但阅读性降低，出错时也更难找到问题点。

  另外多个职责耦合在一起，会影响复用性。



* 开放封闭原则 (Open-Close principle, OCP)

  > 通过**增加新代码**来扩展系统的功能，而不是通过**修改原本已经存在的代码**来扩展系统的功能。

  当未来需求有异动时，在不变动现在正常运行的代码之下，通过其他方式新增代码，实现新需求。

  如果为了新需求而改动原有代码，可能会造成其他调用原本代码时发生非预期错误。

  *注：为了使程序的扩展性好，易于维护和升级，我们需要使用接口和抽象类。*




* 里氏替换原则 (Liskov substitution principle, LSP)

  任何基类可以出现的地方，子类一定可以出现（替换）。

  需满足：子类可以扩展父类的功能，但不能改变父类原有的功能。

  只有当衍生类可以替换掉基类，软件单位的功能不受到影响时，基类才能真正被复用，而衍生类也能够在基类的基础上增加新的行为。

  *注：实现 OCP 原则的关键步骤就是抽象化，而基类与子类的继承关系是抽象化的具体实现，所以里氏代换原则是对实现抽象化的具体步骤的规范。*





* 接口隔离原则 (Interface segregation principle, ISP)

  使用多个隔离的小接口，比使用单个整合在一起的大接口要好。

  为了方便维护和升级已有的代码，需要尽量降低类之间的耦合度，降低依赖，降低耦合。




* 依赖反转原则 (Dependency inversion principle, DIP)

  要依赖于抽象，而不依赖于具体。

  即高低阶层代码都依赖一个抽象类，在抽象类中定义所依赖的方法，并由子类去实现。



* 最少知识原则（Least knowledge principle, LKP）

  > Talk only to your immediate friends 

  实体之间的联系（通信/交流）应当尽量少。

  即一个实体应当尽量少的与其他实体之间发生相互作用，使得系统功能模块相对独立。

  这样当一个模块修改时，就会尽量少的影响其他的模块，扩展会相对容易（主要还是解耦思想）。




### DRY 原则

  > Do not repeat yourself

  系统的每一个功能都应该有唯一的实现。

  也就是说，如果多次遇到同样的问题，就应该抽象出一个共同的解决方法，不要重复开发同样的功能。

  也指在软件开发中，减少重复的代码（包括注释，无意或隐藏的重复代码片段），降低耦合，方便后期扩展维护。



### KISS 原则

  > Keep it simple and stupid

  大道至简，简单逻辑处理好了，系统才会稳固。



### YAGNI 原则

  > You Ain't Gonna Need It

  是指你自以为有用的功能，实际上都是用不到的（极限编程思想）。

  要尽可能快、尽可能简单地让软件运行起来（do the simplest thing that could possibly work）

  另外在设计层面上，也包含“不要为了设计而设计”的思想，大道至简，如无必要，勿增实体（禅）。




### ROT 原则

  > Rule of three

  是指某个功能出现第三次时才进行"抽象化"。

  这样的好处是：

  * **省事**。如果一种功能只在一两个地方用到，就不需要在抽象上耗费时间。

  * **容易发现模式**。"抽象化"需要找到问题的模式，问题出现的场合越多，就越容易看出模式，从而可以更准确地抽象。



### CRP 原则

  > Composite Reuse Principle

  要尽量使用组合/聚合关系，少用继承。

  通过关联关系（组合/聚合）来使用一些已有对象，并使之成为新对象的一部分。

  然后通过新对象委派调用已有对象的方法，以达到复用其已有功能的目的。



## 种类一 Creational Design Pattern
### 🍕 Simple Factory
目的
> 给 Client 产生东西的方法，但不暴露产生的逻辑。

何时使用
> 要产生的实体需要比较多一些逻辑时，避免在产生多个实体造成太多 Code 重复。

💎 [Code](src/Creational/SimpleFactory.dart)

---
### 🍔 Factory Method
目的
> 建立 Interface ，但给 SubClass 自行决定要如何初始化。将初始化延至 SubClass。

何时使用
> 当 SubClass 有共用的属性，但需要在 Runtime 时动态决定一些事情。即 Client 不需知道 SubClass 的 Detail。

💎 [Code](src/Creational/FactoryMethod.dart)

---
### 🍟 Abstract Factory
目的
> 建立一个 Interface 囊括所有相关实体的家族，且不暴露他们的 Class 。

何时使用
> 当有一些相依实体需要维护，且产生逻辑有一定的复杂程度时，将依赖关系放到抽象工厂中。

💎 [Code](src/Creational/AbstractFactory.dart)

---
### 🌭 Builder
目的
> 将复杂的实体拆开成每个零件，像游戏角色一样，有职业、性别、头发等等。

何时使用
> 当一个实体有很多分部，并且想避免"伸缩建构"时。 
> Character(name, hair, profession, ......) 全部挤在一个 constructor 中。
> 跟 Factory 不同的是，Factory 通常一步就可以生产，而 Builder 需要多步建构。

💎 [Code](src/Creational/Builder.dart)

---
### 🍿 Prototype
目的
> 利用已有实体的方式 Clone 创建新的实体。

何时使用
> 当要创建一个实体非常类似于现有实体时。

💎 [Code](src/Creational/Prototype.dart)

---
### 🥞 Singleton
目的
> 确保建立出来的实体只会有一个实例，并且提供给 client 一个全局变量来使用他。

何时使用
> 当你想确保实体不会被重复产生时。

💎 [Code](src/Creational/Singleton.dart)

---

## 种类二 Structural Design Pattern
### 🍙 Adapter
目的
> 将一个 Interface 转换成另一个 Interface 。让原本不可能一起工作的 Class 变成可能。

何时使用
> 当你想使用现有 Class 但他的 interface 不符合你的规定。

💎 [Code](src/Structural/Adapter.dart)

---
### 🍣 Bridge
目的
> 以组合取代继承，可以避免继承过度。

何时使用
> 当网站有多个页面有不同主题时，要把每个页面都继承多个主题 ? 还是把页面跟主题结合起来 ?

💎 [Code](src/Structural/Bridge.dart)

---
### 🍖 Composite
目的
> 将相同 interface 但不同功能的实体，集中到树状结构来管理。

何时使用
> 当有一群类似的实体，想要集中管理时。

💎 [Code](src/Structural/Composite.dart)

---
### 🍤 Decorator
目的
> 能够动态的加入功能给任一实体，提供比继承更有弹性的扩展。

何时使用
> 当要动态加入的功能过多，用继承会变得很好笑的时候。

💎 [Code](src/Structural/Decorator.dart)

---
### 🥙 Facade
目的
> 创造一个 High-Level 的接口，来让底下的系统更好被使用。

何时使用
> 当你有一堆小的子系统，要一个一个操作很繁杂的时候。

💎 [Code](src/Structural/Facade.dart)

---
### 🥗 FlyWeight
目的
> 利用共享来有效处理大量相似的实体，进而最小化内存的用量。

何时使用
> 当有大量实体要使用时，或是处理实体很花费内存时。

💎 [Code](src/Structural/FlyWeight.dart)

---
### 🥣 Proxy
目的
> 利用代理模式可以让一个 Class 来代理实现另一个 Class 的功能

何时使用
> 当一个 Class 有较多元及复杂的功能需要另一个 Class 的帮忙来实现时。

💎 [Code](src/Structural/Proxy.dart)

---

## 种类三 Behavioral Design Pattern
### 🍛 Chain of Responsibility
目的
> 帮助串联实体，并且在 Request 时从最前面的实体往后找起，直到找到可以符合条件的实体。
> 假设你有 A, B, C 三个帐户，要求消费时由 A 开始扣款，如果 A 不够再去找 B , C 。

何时使用
> 如果有多个实体可以用来处理 request ，并且想要他们有优先顺序时。

💎 [Code](src/Behavioral/ChainOfResponsibility.dart)

---
### 🥨 Command
目的
> 想像你是 client ，服务员是 invoker ，主厨是 receiver。
> Command 将 Actions 封装在实体中，提供方法去解耦 client 和 receiver 。

何时使用
> 需要记录 Request 的历史时，需要实现 callback 和 undo 时。

💎 [Code](src/Behavioral/Command.dart)

---
### 🍦 Iterator
目的
> 在不暴露内部逻辑情况下，按顺序将集合实体显示出来。

何时使用
> 想要统一 Traversal 方法，或想支援多层 Traversal 时。

💎 [Code](src/Behavioral/Iterator.dart)

---
### 🍨 Mediator
目的
> 新增一个中介者 (mediator) 来控制两个实体的交流，进而减少两者的耦合。

何时使用
> 当有两个实体要沟通时，沟通过程十分复杂，需要有效管理时。

💎 [Code](src/Behavioral/Mediator.dart)

---
### 🍬 Memento
目的
> 在不影响封装的情况下，让实体能够 Restore 到某一个状态。

何时使用
> 当你需要暂时将实体存下 Snapshot 以便在未来方便复原。

💎 [Code](src/Behavioral/Memento.dart)

---
### 🍮 Observer
目的
> 定义出一个一对多的实体关係，当实体改变状态时，订阅他的对象将全部收到更新。

何时使用
> 当你的实体之间有一方依赖于另一方，并且在一方改变时想要即时更新其他相依对象时。

💎 [Code](src/Behavioral/Observer.dart)

---
### 🍩 Visitor
目的
> 定义新的 Operation 由实体实现，而不改变原本的实体。

何时使用
> 当你想维持 class 不变，但又常常需要帮他加入新的 Operation 。

💎 [Code](src/Behavioral/Visitor.dart)

---
### 🍻 Strategy
目的
> 定义一群相关的策略并将每个策略封装起来，使他们可以在不同情况下交互使用。

何时使用
> 当你需要依情况使用表面相差不大但方法不同的实体，并且想把每个实体的复杂方法隐藏起来时。

💎 [Code](src/Behavioral/Strategy.dart)

---
### 🍰 State
目的
> 让实体的行为根据其内部 "state" 的改变而改变，看起来会像实体自己改变了他的 class 。

何时使用
> 当你的实体有非常多条件变量时，想让实体因这些条件而改变。

💎 [Code](src/Behavioral/State.dart)

---
### 🥝 Template
目的
> 定义好接口后，将一些属性交给实现的实体决定。且该决定不会影响原本接口的架构。

何时使用
> 当你有不变的架构，但想要有不同的行为时。交给 SubClass 来扩展即可。

💎 [Code](src/Behavioral/Template.dart)

---

## 感谢

我很早就想系统地学习一遍设计模式，直到我下定决心，然后在 [Github](https://github.com/) 幸运地遇到了 [windsuzu/Design-Pattern](https://github.com/windsuzu/Design-Pattern) 这个项目，写的很棒，非常感谢原作者！

本项目的所有内容是在 [windsuzu/Design-Pattern](https://github.com/windsuzu/Design-Pattern) 的基础上做了一些小小的修改，并添加了一些我的个人理解。

致敬！

*PS：本人初次学习设计模式，错误和不足之处在所难免，欢迎大家批评指正。*


