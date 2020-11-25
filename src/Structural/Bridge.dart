import '../example.dart';

// 我们有多重主题，现在把主题的公共属性抽象出来
abstract class MyTheme {
  String getColor();

  String getFont();
}

// 子主题实现父类中的方法
class DarkTheme implements MyTheme {
  @override
  String getColor() => "Dark black";

  @override
  String getFont() => "Arial";
}

class LightTheme implements MyTheme {
  @override
  String getColor() => "Light white";

  @override
  String getFont() => "Times New Roman";
}

// 现在有两个页面使用不同的主题，
// 如果让两个页面分别继承两种不同的主题，则需要写4个页面
// 所以这里我们可以继续抽象出一层Bridge来组合不同的页面跟主题
abstract class WebPage {
  //粘合主题与页面内容
  MyTheme theme;

  WebPage(this.theme);

  String content();
}

class HomePage extends WebPage {
  HomePage(MyTheme theme) : super(theme);

  @override
  String content() =>
      "This is home page in ${theme.getColor()} color and ${theme.getFont()} font.";
}

class AboutPage extends WebPage {
  AboutPage(MyTheme theme) : super(theme);

  @override
  String content() =>
      "This is about page in ${theme.getColor()} color and ${theme.getFont()} font.";
}

class Bridge extends Example {
  Bridge([String filePath = "src/Structural/Bridge.dart"]) : super(filePath);

  @override
  String testRun() {
    final lightTheme = LightTheme();
    final darkTheme = DarkTheme();

    final homePage = HomePage(lightTheme);
    final aboutPage = AboutPage(darkTheme);

    return """
    // Check our home page with light theme.
    ${homePage.content()}
    
    // Check our about page with dark theme.
    ${aboutPage.content()}
    """;

    // Bridge👇👇👇
    // // Check our home page with light theme.
    // This is home page in Light white color and Times New Roman font.
    
    // // Check our about page with dark theme.
    // This is about page in Dark black color and Arial font.
  }
}
