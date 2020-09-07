import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());


// ーーー レス（アプリ本体は状態変化しない、home画面は変化するので【フル】） ーーーーーーーーーー
// StatelessWidget」を継承することでアプリ自体がWidgetに
class MyApp extends StatelessWidget {

  @override
  // build()メソッドでウィジェットのUIを作成

  Widget build(BuildContext context) {
    // ランダム文字発生インスタンス
    // final wordPair = WordPair.random();
    return MaterialApp(
      // アプリタイトルゆえ画面非表示
      // title: "Welcome to Flutter",
      title: "Name Generator",
      // ホーム画面を、ヘッダーとバディで構成と宣言
      // scaffold -> RandomWords
      home: RandomWords(
      //   appBar: AppBar(
      //     // アプリバー＝ヘッダータイトル
      //     title: Text("WELCOME TO FLUTTER"),
      //   ),
      //   body: Center(
      //     // child: Text("Hello World"),
      //     // child: Text(wordPair.asPascalCase),
      //     // 状態変化する部分はフル、メソッド化へ外出し、クラス作成して繋ぐ
      //     child: RandomWords(),
      //   ),
      ),
    );
  }
}



// 【フル_Widget -> ビュー】-------
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

// 【フル_state -> コントローラー】-------
// State<Randomwords> -> RandomWordsウィジェットの状態を維持
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];  //単語保存用、配列の型を<>で指定
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override

  // Widget build(BuildContext context) {
  //   final wordPair = WordPair.random();
  //   return Text(wordPair.asPascalCase);
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NAME GENERATOR'),
      ),
      // _buildSuggestions()を呼び出す
      body: _buildSuggestions(),
    );
  }

  // スクロールするたびにリストが無限に増加
  Widget _buildSuggestions() {
    return ListView.builder(
        // padding外形の成形
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {

          // 偶数行の場合にListTileを表示し、奇数行のときにDividerを表示
          if (i.isOdd) return Divider(); // 《奇数行の場合》

          // 《偶数行の場合》行数を2で割ったときの整数値
          final index = i ~/ 2;

          if (index >= _suggestions.length) {
          // 利用可能な英文リスト数を超えた場合は、10個の英文を生成しリストに追加
            _suggestions.addAll(generateWordPairs().take(10));
          }

          // _buildRowメソッド（外だし）で表示用
          return _buildRow(_suggestions[index]);

        });
  }

  //  上記widgetから飛んでくる
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }



}