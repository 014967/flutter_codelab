import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*
  build()함수 자체가 StatelessWidget이 가지고 있어서 위젯의 상황이 변경될때 마다 자동으로 호출
   */
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier { // 변경사항에 관헤 다른 항목에 알릴 수 있다.
  var current = WordPair.random();

  void getNext(){
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    watch 메서드를 사용하여 앱의 현재 상태에 관한 변경사항을 추적.
     */
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random AWESOME idea:'),
          Text(appState.current.asLowerCase),

          ElevatedButton(
            onPressed: (){
              appState.getNext();
              print('button pressed!');
            },
            child: Text('Next'),
          )
        ],
      ),
    );
  }
}

/*
모든 build 메서드는 위젯 또는 중첩된 위젯 트리를 반환해야합니다.
최상위 위젯은 Scaffold입니다.


 */