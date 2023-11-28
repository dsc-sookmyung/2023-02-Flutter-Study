# 4. Stateful Widgets
## 4.0 State
Stateful 위젯을 배워보자, stateless 위젯과 달리 상태에 따라 변할 데이터를 보여준다.
버튼을 추가하여 누를 때마다 횟수가 증가하도록 코드 작성

## 4.1 setState
setState는 State 클래스에게 데이터가 변경되었다고 알리는 함수.
즉 setState를 사용해서 state가 반응해서 스스로 새로고침할 수 있도록 한다
데이터에 대한 변화를 무조건 setState 안에 넣지 않아도 되지만 가독성을 위해 함수 안에 넣는 것이 좋음.

## 4.2 Recap

## 4.3 BuildContext
플러터는 앱의 모든 스타일을 한 곳에서 지정할 수 있는 기능을 제공한다. 매번 copy paste 할 필요 없다는 말!
AppState 위젯에서 별도의 위젯을 분리. 

flutter 위젯 트리. context는 해당 child 이전에 있는 모든 상위 요소들에 대한 정보. 즉 부모 요소들의 모든 정보, 위젯트리의 정보를 가지고 있다.
매우 먼 요소의 데이터를 가지고 올 수 있기 때문에 유용. 부모 뿐만 아니라 부모의 부모, 부모의 부모의 부모 요소까지 모두. 

BuildContext는 위젯 트리에서 위젯의 위치를 제공하고 이를 통해 상위 요소 데이터에 접근할 수 있다! 

## 4.4 Widget Lifecycle
위젯들은 생명주기, lifecycle을 가지고 있다.
initState는 상태를 초기화하기 위한 메소드이다. 필수로 사용하지 않아도 된다. 부모 요소에 의존하는 데이터를 초기화하는 경우가 있어 context에서 수정하는 경우에 사용한다. initState가 build 메소드보다 항상 먼저 호출되어야 한다. 

dispose 메소드는 무언가를 제거하고 싶을 때 사용. 위젯이 위젯트리에서 제거되기 전에 취소하고 싶을 때. 

# 5. Pomodoro App
## 5.0 User Interface
25분 일하고 5분 휴식 가능한 pomodoro app을 만들어보자
flexible과c ontainter를 사용하여 화면을 구성한다. 
flexible은 남은 공간을 얼만큼 차지할 지 일종의 비율로 구성할 수 있는 방법인데, 이 방법으로 같은 비율로 일정하게 나누어 화면을 구성할 수 있다.

## 5.1 Timer
플러터 자체의 timer 위젯으로 타이머 제작 가능. 
import 'dart:async'; 

## Pause Play
타이머 일시정지 버튼을 만들자
onPressed: isRunning ? onPausePressed : onStartPressed,
새로운 함수를 만들어 아이콘을 누르면 아이콘의 모양이 변경되며 타이머가 작동된다.

## 5.3 Data Format
기존의 시간이 1500초로 보기 불편하게 표시되어 duration = Duration(seconds: seconds);을 이용해 시, 분, 포 형태로 바꾸었다.
하지만 우리가 필요한 것은 분과 초 뿐이어서 리스트에서 잘라내 우리가 원하는 25:00 형식으로 바꾸었다.

## 5.4 Code Challenge
stop 아이콘을 추가하여 restar가능하도록 코드를 추가하였다.