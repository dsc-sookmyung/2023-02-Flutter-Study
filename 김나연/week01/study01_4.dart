/* 서버요청을 하게 될 때 cpu를 막아버려서 cpu를 낭비하는 상황 발생=> 비효율적=>Async Programming 사용
void main() {
  addNumbers(1, 1);
  addNumbers(2, 2);
}

void addNumbers(int number1, int number2) {
  print('계산중: $number1 + $number2');
  print('계산완료: ${number1 + number2}');
}
결과 순서를 잘 기억하자.
*/

void main() {
  //Future=미래에 받아올 값
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);
  /*
  print('함수 시작');
  Future.delayed(Duration(seconds: 2), () {
    print('Delay 끝'); //2초 정도 지연 후 값 출력
  });
  */
  addNumbers(1, 1);
}

void addNumbers(int number1, int number2) {
  print('계산 시작 : $number1 + $number2 = ${number1 + number2}');
  Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $number1 + $number2 = ${number1 + number2}');
  });
  print('함수 완료');
} //계산 시작->함수 완료->계산 완료 순으로 출력

/* await 함수 사용
void addNumbers(int number1, int number2) async{
  print('계산 시작 : $number1 + $number2 = ${number1 + number2}');
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $number1 + $number2 = ${number1 + number2}');
  });
  print('함수 완료 : $number1 + $number2');
}
=>계산 시작->계산 완료->함수 완료 순으로 출력
await 함수를 써도 cpu를 효율적으로 사용함.
*/

/* main 함수에 await 함수를 사용하여 순서대로 출력하게 할 수 있다.
void main() async {
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);
  await addNumbers(1, 1);
  await addNumbers(2, 2);
}

Future<void> addNumbers(int number1, int number2) async {
  print('계산 시작 : $number1 + $number2 = ${number1 + number2}');
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $number1 + $number2 = ${number1 + number2}');
  });
  print('함수 완료 : $number1 + $number2');
}

반환값 받기
void main() async {
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);
  final result1 = await addNumbers(1, 1);
  final result2 = await addNumbers(2, 2);
  print('result1: $result1');
  print('result2: $result2');
}

Future<int> addNumbers(int number1, int number2) async {
  print('계산 시작 : $number1 + $number2 = ${number1 + number2}');
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $number1 + $number2 = ${number1 + number2}');
  });
  print('함수 완료 : $number1 + $number2');
  return number1 + number2;
}

*/

//future
//한 함수에서 하나의 반환값을 가진다.=>stream은 yield를 활용해서 여러개의 값을 반환받을 수 있다.
import 'dart:async';
void main(){
  final controller=StreamController();
  final stream=controller.stream;
  
  final streamListener1=stream.listen((val){
    print('Listener 1 : $val');
  });
  
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}

/* 리스닝 여러 번 하기
import 'dart:async';
void main() {
  final controller = StreamController();
  final stream =
      controller.stream.asBroadcastStream(); //이 브로드캐스트를 붙임으로서 여러번 리스닝을 할 수 있다.

  final streamListener1 = stream.listen((val) {
    print('Listener 1 : $val');
  });

  final streamListener2 = stream.listen((val) {
    print('Listener 2 : $val');
  });
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}

데이터가 들어오는 순간에 변형을 주거나 데이터를 다룰 수 있다.
void main() {
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();
  final streamListener1 = stream.where((val) => val % 2 == 0).listen((val) {
    print('Listener 1 : $val');
  });

  final streamListener2 = stream.where((val) => val % 2 == 1).listen((val) {
    print('Listener 2 : $val');
  });
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}
*/

//함수에서 async 쓰기
import 'dart:async';

void main() {
  calculate(1).listen((val) {
    print('calculate(1) : $val');
  });
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number; //return=>yeild
  }
}
/* await 사용하기
import 'dart:async';

void main() {
  calculate(2).listen((val) {
    print('calculate(2) : $val');
  });
  calculate(4).listen((val) {
    print('calculate(4) : $val');
  });
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number;

    await Future.delayed(Duration(seconds: 1));
  }
}

순서대로 하는 방법
import 'dart:async';

void main() {
  playAllStream().listen((val) {
    print(val);
  });
}

Stream<int> playAllStream()async*{
  yield* calculate(1); //이 스트림의 모든 값이 나올 때까지 기다린다.
  yield* calculate(1000);
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number;

    await Future.delayed(Duration(seconds: 1));
  }
}

*/
