import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

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

// main関数、MyApp、MyHomePageはデフォルトから変更がないため省略
// class _MyHomePageState extends State<MyHomePage> {
//   XFile? _image;
//   final imagePicker = ImagePicker();

//   // カメラから画像を取得するメソッド
//   Future getImageFromCamera() async {
//     final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       if (pickedFile != null) {
//         _image = XFile(pickedFile.path);
//       }
//     });
//   }

//   // ギャラリーから画像を取得するメソッド
//   Future getImageFromGarally() async {
//     final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = XFile(pickedFile.path);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Center(
//             // 取得した画像を表示(ない場合はメッセージ)
//             child: _image == null
//                 ? Text(
//                     '写真を選択してください',
//                     style: Theme.of(context).textTheme.headline4,
//                   )
//                 : Image.file(File(_image!.path))),
//         floatingActionButton:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//           // カメラから取得するボタン
//           FloatingActionButton(
//               onPressed: getImageFromCamera,
//               child: const Icon(Icons.photo_camera)),
//           // ギャラリーから取得するボタン
//           FloatingActionButton(
//               onPressed: getImageFromGarally,
//               child: const Icon(Icons.photo_album))
//         ]));
//   }
// }

// main関数、MyApp、MyHomePageはデフォルトから変更がないため省略

class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController? _controller;
  final imagePicker = ImagePicker();

  // カメラから動画を取得するメソッド
  Future getVideoFromCamera() async {
    XFile? pickedFile = await imagePicker.pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      _controller = VideoPlayerController.file(File(pickedFile.path));
      _controller!.initialize().then((_) {
        setState(() {
          _controller!.play();
        });
      });
    }
  }

  // ギャラリーから動画を取得するメソッド
  Future getVideoFromGarally() async {
    XFile? pickedFile =
        await imagePicker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      _controller = VideoPlayerController.file(File(pickedFile.path));
      _controller!.initialize().then((_) {
        setState(() {
          _controller!.play();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            // 取得した動画を表示(ない場合はメッセージ)
            child: _controller == null
                ? Text(
                    '動画を選択してください',
                    style: Theme.of(context).textTheme.headline4,
                  )
                : VideoPlayer(_controller!)),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // カメラから取得するボタン
          FloatingActionButton(
              onPressed: getVideoFromCamera,
              child: const Icon(Icons.video_call)),
          // ギャラリーから取得するボタン
          FloatingActionButton(
              onPressed: getVideoFromGarally,
              child: const Icon(Icons.movie_creation))
        ]));
  }
}
