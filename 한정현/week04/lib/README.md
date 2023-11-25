# 4 Stateful Widgets

Stateful Widget?
-> 말 그대로 state(상태)를 가지고 있기 때문.
상태에 따라 데이터를 변경할 수 있다.
위젯에 데이터를 저장하고 실시간으로 데이터의 변화를 볼 수 있다.

1.  상태가 없는 위젯 그 자체.
2.  위젯의 상태인 state - 데이터와 UI를 넣는 위치
    => Stateful Widget을 만들고 싶은 경우 code action을 통해 선택할 수 있다.

setState()
: State에게 데이터가 변경됐음을 알리는 함수.
하지만 반드시 setState() 안에 데이터 변경식을 넣어야하는 것은 아니다.
변경식과 함수를 따로 기술해도 의도하는데로 실행이 가능하다.

Dart는 null safe 언어이기 때문에 우리가 null 값에 접근할 수 있는 경우들을 방지하기 원함. 그래서 property의 값이 없어도 되는 경우를 위해 ! 또는 ? 을 붙이면 해결이 된다.

=> stateful widget은 살아있다!
즉, 이벤트에 반응한다.

Widget Life Cycle
initState()
: build 이전에 호출되어 변수를 초기화하고 API 업데이트를 도와준다.
dispose()
:위젯이 위젯트리에서 제거될 때 발생. 메서드 안에서 이벤트 리스너 같은 것들을 구독 취소한다.
build()
: 위젯에서 UI를 만든다
