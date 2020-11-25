import '../example.dart';

// 招聘广告
class JobPost {
  String _title;

  JobPost(this._title);
}

// Observer 负责接收 Observable 的更新
// 负责订阅 Observable 并接收更新
abstract class JobObserver {
  void update(JobPost post);
}

// Observable 负责通知所有订阅的 Observer 更新
// 负责管理 JobObserver 订阅者
abstract class JobObservable {
  void notify(JobPost post);

  void attach(JobObserver observer);

  void detach(JobObserver observer);
}

// 找工作者
// 需要订阅 JobObserver 的更新
class JobSeeker implements JobObserver {
  String _name;

  JobSeeker(this._name);

  @override
  void update(JobPost post) =>
      print("Hi, $_name, New job posted: ${post._title}.");
}

// 人才市场
// 需要维护 JobObservable 的各种 JobObserver 订阅者
class EmploymentAgency implements JobObservable {
  static List<JobObserver> _observers = [];

  void notify(JobPost post) {
    // 当有新的招聘信息时，通知所有的订阅者更新
    _observers.forEach((observer) => observer.update(post));
  }

  void attach(JobObserver observer) => _observers.add(observer);

  void detach(JobObserver observer) => _observers.remove(observer);

  //发布新的招聘信息
  void postJob(JobPost post) => notify(post);
}

class Observer extends Example {
  Observer([String filePath = "src/Behavioral/Observer.dart"])
      : super(filePath);

  @override
  String testRun() {
    var jay = JobSeeker("Jay");
    var wei = JobSeeker("Wei");

    var agency = EmploymentAgency(); //订阅中心
    agency.attach(jay); //添加订阅者1
    agency.attach(wei); //添加订阅者2

    agency.postJob(JobPost("Software Engineer"));
    agency.postJob(JobPost("Marketing Manager"));

    // 使用完毕后记得 dispose 回收内存
    agency.detach(jay); //移除订阅者
    agency.detach(wei);
    return  '';

    // Observer👇👇👇
    // Hi, Jay, New job posted: Software Engineer.
    // Hi, Wei, New job posted: Software Engineer.
    
    // Hi, Jay, New job posted: Marketing Manager.
    // Hi, Wei, New job posted: Marketing Manager.
    
  }
}
