// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );

  }
}

/**
 * 添加一个 stateful widget（有状态的 widget）—— RandomWords，它会创建自己的状态类 —— RandomWordsState，
 * 然后你需要将 RandomWords 内嵌到已有的无状态的 MyApp widget。
 */
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // 该方法通过将生成单词对的代码从 MyApp 移动到 RandomWordsState 来生成单词对。
    //删除 MyApp 里生成文字的代码
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

/**
 * 添加有状态的 RandomWords widget 到 main.dart，RandomWords widget 除了创建 State 类之外几乎没有其他任何东西
 */
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
