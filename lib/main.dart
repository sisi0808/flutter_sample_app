import 'package:flutter/material.dart';

// 1. エントリーポイントのmain関数
void main() {
  // 2. MyAppを呼び出す
  runApp(const MyApp());
}

// MyAppのクラス
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3. タイトルとテーマを設定する。画面の本体はMyHomePageで作る。
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // 5. カウンタが押された時のメソッド
  void _incrementCounter() {
    setState(() {
      _counter++;
      // print("HelloWorld");
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4. MyHomePageの画面を構築する部分
    return Scaffold(
      // 画面上部のタイトル部分
      appBar: AppBar(
          // title: Text(widget.title),
          title: Row(
        children: const [
          Icon(Icons.create),
          Text("初めてのタイトル"),
        ],
      )),
      // body: Text("HellowWorld"),
      body: Column(
        children: [
          const Text("Hello World"),
          const Text("ハロー・ワールド"),
          TextButton(
            onPressed: () => {print("ボタンが押された")},
            child: const Text("テキストボタン"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),
              Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 30.0,
              ),
              Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 36.0,
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {print("押したね？")},
          tooltip: 'Increment',
          child: const Icon(Icons.timer)),
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      endDrawer: const Drawer(child: Center(child: Text("Drawer"))),
    );
  }
}
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // 画面の中央に表示されるテキスト
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             // テキストの下に表示されるカウンタ値
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       // 右下の「+」ボタンに対応するフローティングアクションボタン
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }