### 1. Stateful Widget

- 위젯에 데이터를 저장, 실시간으로 변화 관찰 가능 => Stateful
- 위젯에 아무 데이터가 없음 => Stateless

## setState

상태를 변화시키기 위해서는 setState 함수를 이용한다.

📝 Sample Code

```dart
  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }
```

- createState : state를 생성하는 곳이다. statefulWidget에서 state를 실행
- initState : state를 초기화하는 함수이다. initState는 statefulWidget이 실행하면 단 한 번만 작동. 그 이후 작동시키기 위해서는 해당 statefulWidget을 종료(dispose)한 후에 가능하다.
- dispose: 화면이 종료될 때 호출이 된다.
- dispose, initState 모두 statefulwidget에서만 사용가능!

### 2. Pomodoro App

- Flexible : 박스로 일정 비율을 나눌 때 사용.
- Expanded : flex:1 의 Flexible 박스와 같다. flex:1 을 가지면 박스 하나가 화면을 꽉 채우게 된다.
- Timer: 0까지 카운트 다운된다. 타이머가 0에 도달하면 타이머는 지정된 콜백 함수를 실행한다.
  📝 Sample Code

```dart
  void main() {
  scheduleTimeout(5 * 1000); // 5 seconds.
}

Timer scheduleTimeout([int milliseconds = (특정시간)]) =>
    Timer(Duration(milliseconds: milliseconds), (특정 시간 후 이루어질 작업));

```
