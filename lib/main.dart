// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //更新 MyApp 的 build() 方法，修改 title 的值来改变标题，修改 home 的值为 RandomWords widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        home: RandomWords(),
    );

  }
}

/**
 * 扩展（继承）RandomWordsState 类，以生成并显示单词对列表
 */
class RandomWordsState extends State<RandomWords> {
  //添加一个 _suggestions 列表以保存建议的单词对，同时，添加一个 _biggerFont 变量来增大字体大小
  //在 Dart 语言中使用下划线前缀标识符，会 强制其变成私有
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);


  //添加 _buildSuggestions() 方法,此方法构建显示建议单词对的 ListView。
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //更新 RandomWordsState 的 build 方法以使用 _buildSuggestions()，而不是直接调用单词生成库
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }



}

/**
 * 添加有状态的 RandomWords widget 到 main.dart，RandomWords widget 除了创建 State 类之外几乎没有其他任何东西
 */
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
