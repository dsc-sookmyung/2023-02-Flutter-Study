# 배운 것 정리

## #4 정리

- 위젯은 stateful widjet과 stateless widjet으로 나뉨.
  ```
  List<int> numbers = [];
   void onClicked() {
      //setState: State 클래스에게 데이터가 변경되었음을 알리는 함수
      //변화를(setState 안에 넣지 않아도) 작동함.
      setState(() {
        numbers.add(numbers.length);
      });
    }
  ```
- theme: 앱의 모든 스타일을 한 곳에 지정할 수 있음.
  ```
  theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
  ```
- context: 부모 요소에 접근할 수 있게 해줌.
  ```
  color: Theme.of(context).textTheme.titleLarge!.color, //?를 사용해도 된다.
  ```
- initState(): 상태를 초기화하기 위한 메소드(주로 부모 요소에 의존하는 데이터를 초기화하기 위해, 혹은 API 업데이트를 구독하려 할 때 사용한다.)
  - build 메소드보다 먼저 호출해야 하며, 단 한 번만 호출해야 한다.
- dispose(): 위젯이 스크린에서 제거될 때 호출됨.

## #5 정리

- flexible: 유동적으로 크기를 기기에 맞게 바꿔준다.
- expanded: 확장시켜 준다.
- late: 바로 초기화를 해도 되지 않아도 되도록 해줌.
