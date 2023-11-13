# 2주차
## 2.1 Dart Pad
Flutter 설치하지 않고도 Dart Pad에서 코드 작성 가능!

## 2.2 Running Flutter
window 노트북이어서 android 환경만 실행해 보았는데, 똑같은 화면이 크롬 화면에서도 뜨며 변경사항이 생기더라도 바로 적용되는 모습을 보임

## 2.3 Hello World
widget은 레고 블럭과 같은 존재. 합쳐 UI, 앱을 만들 수 있다. 

build 메소드가 앱의 UI를 만들게 됨.
Material app은 google, Cupertino app은ios 느낌이 나도록 앱 만들기

화면이 scaffold라는 가지는 것을 가져야 하는데, text만 무작정 작성하면 제일 위에 작성된다. 

## 2.4 Recap
위젯으로 우리가 원하는 모든 것들을 실행할 수 있다니,,,
home 안에 scaffold라는 화면의 구조를 지정하는 위젯을 넣고 넣고 할 수 있다.

## 2.5 Classes Recap
오늘 실행 코드~
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter!'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

```