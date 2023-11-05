# 1주차 과제
## Fuctional Programming 함수형 프로그래밍

```java
void main() {
  List<String> blackPink = ['로제', '지수', '리사', '제니', '제니'];

  print(blackPink);
  //맵으로 변환, key에는 인덱스, value에는 이름
  print(blackPink.asMap());
  //set으로 변환, 중복을 제거하는 역할도 함
  print(blackPink.toSet());

  //반대로
  Map blackPinkMap = blackPink.asMap();

  print(blackPinkMap.keys.toList());
  print(blackPinkMap.values.toList());
  
 //Set로 형변환. 자유롭게 형변환이 가능하다
  Set blackPinkSet = Set.from(blackPink);
  
  print(blackPinkSet.toList());
}

```

```java
void main() {
  List<String> blackPink = ['로제', '지수', '리사', '제니'];

  //함수에 함수의 파라미터를 또 넣어준다
  final newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x';
  });

  print(blackPink);
  print(newBlackPink.toList());

  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');

  print(newBlackPink2.toList());

  print(blackPink == blackPink);
  print(newBlackPink == blackPink);
  print(newBlackPink == newBlackPink2);

  // [1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg] 형태로 변환
  String number = '13579';

  final parsed = number.split('').map((x) => '$x.jpg').toList();

  print(parsed);
}
```

```java
void main() {
  Map<String, String> harryPotter = {
    'Harry Potter': '해리 포터',
    'Ron Weasley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저'
  };

  //Map을 Map으로 바꾸기
  final result = harryPotter.map(
    (key, value) => MapEntry(
      'Harry Potter Character $key',
      '해리포터 캐릭터 $value',
    ),
  );

  print(harryPotter);
  print(result);

  //key 값들을 리스트로 바꾸고 싶을 때
  final keys = harryPotter.keys.map((x) => 'HPC $x').toList();
  final values = harryPotter.values.map((x) => '해리포터 $x').toList();

  print(keys);
  print(values);
}
```

```java
void main() {
  //Set 매핑, 리스트와 거의 똑같은 형식
  Set blackPinkSet = {
    '로제',
    '지수',
    '제니',
    '리사',
  };

  final newSet = blackPinkSet.map((x) => '블랙핑크 $x').toSet();

  print(newSet);
}
```

```java
void main() {
  //where 함수
  List<Map<String, String>> people = [
    {
      'name': '로제',
      'group': '블랙핑크',
    },
    {
      'name': '지수',
      'group': '블랙핑크',
    },
    {
      'name': 'RM',
      'group': 'BTS',
    },
    {
      'name': '뷔',
      'group': 'BTS',
    },
  ];

  print(people);

  final blackPink = people.where((x) => x['group'] == '블랙핑크').toList();
  final BTS = people.where((x) => x['group'] == 'BTS').toList();

  print(blackPink);
  print(BTS);
}
```

```java
void main() {
  //reduce
  List<int> numbers = [1, 3, 5, 7, 9];

  final result = numbers.reduce((prev, next) {
    print('--------------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');

    return prev + next;
  });
  print(result);
}
```

```java
void main() {
  //reduce 반드시 리스트의 타입과 return하는 값들의 타입과 동일하게 해야 한다.
  List<int> numbers = [1, 3, 5, 7, 9];

  final result = numbers.reduce((prev, next) => prev + next);

  print(result);

  List<String> words = [
    '안녕하세요',
    '저는',
    '코드팩토리입니다.',
  ];

  final sentence = words.reduce((prev, next) => prev + next);

  print(sentence);
  
  
}
```

```java
void main() {
  //fold 함수, 두 개의 파라미터. 시작할 값을 먼저 넣어준다.
  List<int> numbers = [1, 3, 5, 7, 9];

  final sum = numbers.fold<int>(0, (prev, next) => prev + next);

  print(sum);

  //아무 형태나 리턴할 수 있다는 장점이 있다.

  List<String> words = [
    '안녕하세요 ',
    '저는 ',
    '코드팩토리입니다.',
  ];

  final sentence = words.fold<String>('', (prev, next) => prev + next);
  print(sentence);

  final count = words.fold<int>(0, (prev, next) => prev + next.length);
  print(count);
}
```

```java
void main() {
  //cascading operator
  List<int> even = [
    2,
    4,
    6,
    8,
  ];

  List<int> odd = [
    1,
    3,
    5,
    7,
  ];

  // cascading operator
  // ...

  print([...even, ...odd]);
  print(even);
  print([...even]);
  print(even == [...even]);
}
```

```java
void main() {
  final List<Map<String, String>> people = [
    {
      'name': '로제',
      'group': '블랙핑크',
    },
    {
      'name': '지수',
      'group': '블랙핑크',
    },
    {
      'name': 'RM',
      'group': 'BTS',
    },
    {
      'name': '뷔',
      'group': 'BTS',
    },
  ];

  print(people);
  //이 값들이 무조건 존재한다는 뜻으로 ! 추가
  final parsedPeople = people
      .map(
        (x) => Person(
          name: x['name']!,
          group: x['group']!,
        ),
      )
      .toList();

  print(parsedPeople);

  for (Person person in parsedPeople) {
    print(person.name);
    print(person.group);
  }

  final bts = parsedPeople.where(
    (x) => x.group == 'BTS',
  );
  print(bts);

  //여러 개의 함수를 chaining하여 새로운 형태를 만들어낼 수 있다.
  final result = people
      .map(
        (x) => Person(
          name: x['name']!,
          group: x['group']!,
        ),
      )
      .where((x) => x.group == 'BTS')
      .fold<int>(
        0,
        (prev, next) => prev + next.name.length,
      );

  // 위의 print(bts)와 같은 결과
  print(result);
}

// Map의 경우에는 자유도가 너무 높다. 구조화가 되어있지 않기 때문에.
// 구조화를 해서 클래스 형태로 다루기

class Person {
  final String name;
  final String group;

  Person({
    required this.name,
    required this.group,
  });

  @override
  String toString() {
    return 'Person(name:$name, group:$group)';
  }
}
```

## Async Programming 비동기 프로그래밍

```java
void main() {
  addNumbers(1, 1);
  addNumbers(2, 2);
}

// 1 + 1 = 2
// 2 + 2 = 4
void addNumbers(int number1, int number2) {
  print('계산중: $number1 + $number2');
  print('계산 완료: ${number1 + number2}');
}
```

```java
void main() {
  // Future 미래
  // 미래에 받아올 값 저장
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  print('함수 시작');

  // Future를 사용하면 async 기능 사용 가능하다
  // delayed - 2개의 파라미터
  // 1번 파라미터 - 지연할 기간(얼마나 지연할 건지) Duration
  // 2번 파라미터 - 지연 시간이 지난 후 실행할 함수
  Future.delayed(Duration(seconds: 2), () {
    print('Delay 끝');
  });
}

void addNumbers(int number1, int number2) {
  print('계산 시작 : $number1 + $number2');

  //서버 시뮬레이션
  Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $number1 + $number2 = ${number1 + number2}');
  });

  print('함수 완료');
}
```

```java
void main() {
  // Future 미래
  // 미래에 받아올 값 저장
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  addNumbers(1, 1);
  addNumbers(2, 2);
}

void addNumbers(int number1, int number2) {
  print('계산 시작 : $number1 + $number2');

  //서버 시뮬레이션
  Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $number1 + $number2 = ${number1 + number2}');
  });

  print('함수 완료 : $number1 + $number2');
}
```

```java
void main() async{
  // Future 미래
  // 미래에 받아올 값 저장
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  await addNumbers(1, 1);
  await addNumbers(2, 2);
}

Future <void> addNumbers(int number1, int number2) async {
  print('계산 시작 : $number1 + $number2');

  //서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $number1 + $number2 = ${number1 + number2}');
  });

  print('함수 완료 : $number1 + $number2');
}
```

```java
void main() async {
  // Future 미래
  // 미래에 받아올 값 저장
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  final result1 = await addNumbers(1, 1);
  final result2 = await addNumbers(2, 2);

  print('result1 = $result1');
  print('result2 = $result2');
  print('result1 + result2 = ${result1 + result2}');
}

Future<int> addNumbers(int number1, int number2) async {
  print('계산 시작 : $number1 + $number2');

  //서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료 : $number1 + $number2 = ${number1 + number2}');
  });

  print('함수 완료 : $number1 + $number2');

  return number1 + number2;
}
```

## Stream
```java
import 'dart:async';

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
```

```java
import 'dart:async';

void main() {
  calculate(1).listen((val) {
    print('calculate(1) : $val');
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
```

```java
import 'dart:async';

void main() {
  playAllStream().listen((val) {
    print(val);
  });
}

Stream<int> playAllStream() async* {
  yield* calculate(1);
  yield* calculate(1000);
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number;

    await Future.delayed(Duration(seconds: 1));
  }
}
```