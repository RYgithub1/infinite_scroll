import 'package:flutter/material.dart';


void main() => runApp(MyApp());


// StatelessWidget」を継承することでアプリ自体がWidgetに
class MyApp extends StatelessWidget {
  @override
  // build()メソッドでウィジェットのUIを作成
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリタイトルゆえ画面非表示
      title: "Welcome to Flutter",
      // ホーム画面を、ヘッダーとバディで構成と宣言
      home: Scaffold(
        appBar: AppBar(
          // アプリバー＝ヘッダータイトル
          title: Text("WELCOME TO FLUTTER"),
        ),
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
