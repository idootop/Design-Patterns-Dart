import 'dart:core';
import 'dart:core' show Iterator;

import '../example.dart';

class Song {
  String name;

  Song(this.name);
}


class Iterator extends Example {
  Iterator([String filePath = "src/Behavioral/Iterator.dart"])
      : super(filePath);

  @override
  String testRun() {
    List<Song> mp3Player = [];

    mp3Player.add(Song("愛をこめて花束を"));
    mp3Player.add(Song("輝く月のように"));
    mp3Player.add(Song("やさしい気持ちで"));

    // Dart 可以直接利用現成 Iterator.
    final iterator = mp3Player.iterator;
    var result = "";

    // 类似遍历单向链表
    while (iterator.moveNext()) {
      result += "Playing ... ${iterator.current.name}.\n";
    }

    return result;


    // Iterator👇👇👇
    // Playing ... 愛をこめて花束を.
    // Playing ... 輝く月のように.
    // Playing ... やさしい気持ちで.


  }
}