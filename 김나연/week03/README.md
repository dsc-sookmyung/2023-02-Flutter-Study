# 3주차 플러터 공부
+ sizedbox: 간격을 줄 때 사용하는 위젯
+ column: 서로를 위아래에 놓고 싶을 때/mainaxis는 수직(세로) 방향, crossaxis는 가로
+ row: 서로를 옆에 놓을 때/mainaxis는 수평(가로) 방향, crossaxis는 세로
+ padding: 전체적인 간격 띄워 줌
+ 개발자 도구를 이용해 화면 배치를 할 수 있음
+ 자식 많으면 children
+ vscode에 파란 줄이 생기는 이유: dart는 constant(값이 안바뀜, compile하기 전에 값을 알고 있음)를 지원함
몇몇 위젯은 상수이다. 그래서 const를 주는 것이 더 나음(더 빨리, 쉽게 동작할 수 있으므로) ex)sizedbox, color
+ transform 위젯으로 크기와 위치에 변화를 줄 수 있다.
+ clipBehavior를 통해 overflow됐을 때 어떻게 처리해야 하는지 알 수 있다
+ 앞에 _를 사용해서 private하게 만들 수 있다.
