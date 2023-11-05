## Week01 - Dart #3, #4

> # Functional Programmming

### ✅ asMap(), toSet(), toList()

✏️실습코드

```dart
void main() {
  List<String> blackPink = ["로제", "지수", "제니", "리사", "제니"];
  print(blackPink); //[로제, 지수, 제니, 리사, 제니]
  print(blackPink.asMap());//{0: 로제, 1: 지수, 2: 제니, 3: 리사, 4: 제니}
  print(blackPink.toSet());//{로제, 지수, 제니, 리사}

  Map blackPinkMap = blackPink.asMap();
  print(blackPinkMap.keys.toList());//[0, 1, 2, 3, 4]
  print(blackPinkMap.values.toList());//[로제, 지수, 제니, 리사, 제니]

  Set blackPinkSet = blackPink.toSet();
  print(blackPinkSet.toList());//[로제, 지수, 제니, 리사]

```

asMap을 사용하면 map으로 형변환을 해준다. key는 리스트의 인덱스, value는 리스트의 값이다. toSet()을 이용하면 리스트에서 중복된 값을 제거해주고, set으로 형변환을 해준다. ()(Iterable) 형태에서 리스트로 만들어 주기 위해 toList()를 사용할 수 있다.

### ✅ map method 활용(List, Map, Set)

```dart
  final newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x';
  });
  print(blackPink);// [로제, 지수, 제니, 리사, 제니]
  print(newBlackPink); //(블랙핑크 로제, 블랙핑크 지수, 블랙핑크 제니, 블랙핑크 리사, 블랙핑크 제니)
  print(newBlackPink.toList());//[블랙핑크 로제, 블랙핑크 지수, 블랙핑크 제니, 블랙핑크 리사, 블랙핑크 제니]

  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');
  print(newBlackPink2.toList()); //[블랙핑크 로제, 블랙핑크 지수, 블랙핑크 제니, 블랙핑크 리사, 블랙핑크 제니]

  print(blackPink == blackPink); //true
  print(newBlackPink == blackPink);//false
  print(newBlackPink == newBlackPink2);//false
```

map 메소드를 활용하여 각 리스트의 멤버를 받아 () iterable 형태로 반환할 수 있다. toList()를 써서 리스트로 변형시켜주면 된다. newBlackPink2 처럼 arrow함수 형태도 사용도 가능하다. 이때 newBlackPink와 newBlackPink2는 출력 값이 같지만, map을 사용하면 새로운 리스트로 만들어지는 것이기 때문에 비교값이 false로 출력된다.

#### ✏️ Map에서 활용한 코드

```dart

  Map<String, String> harryPotter = {
    'harry potter': '해리 포터',
    'Ron Weasley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저',
  };
  final result = harryPotter.map((key, vaule) =>
      MapEntry('Harry Potter Character $key', '해리포터 캐릭터 $vaule'));
  print(result);//{Harry Potter Character harry potter: 해리포터 캐릭터 해리 포터, Harry Potter Character Ron Weasley: 해리포터 캐릭터 론 위즐리, Harry Potter Character Hermione Granger: 해리포터 캐릭터 헤르미온느 그레인저}

  final keys = harryPotter.keys
      .map(
        (e) => 'HPC $e',
      )
      .toList();
  final values = harryPotter.values.map((e) => '해리포터 $e').toList();

  print(keys); //[HPC harry potter, HPC Ron Weasley, HPC Hermione Granger]
  print(values);// [해리포터 해리 포터, 해리포터 론 위즐리, 해리포터 헤르미온느 그레인저]
```

#### ✏️ Set에서 활용한 코드

```dart
  final newSet = blackPinkSet
      .map(
        (e) => '블랙핑크 $e',
      )
      .toSet();
  print(newSet);//{블랙핑크 로제, 블랙핑크 지수, 블랙핑크 제니, 블랙핑크 리사}
```

### ✅ where, reduce

.where()은 map과 유사한데, 괄호 안에 함수를 넣어 작동한다. 리스트 안을 돌면서 true나 false를 반환한다. 이때 true면 유지하고 false면 제거한다. reduce를 실행할 때 prev는 리턴값(맨 처음 값은 첫번째 value), next는 다음값이다. 타입에 유의해야한다.

#### ✏️ where 실습코드

```dart
 List<Map<String, String>> people = [
    {
      'name': '지수',
      'group': '블랙핑크',
    },
    {
      'name': '로제',
      'group': '블랙핑크',
    },
    {
      'name': 'RM',
      'group': 'BTS',
    },
    {
      'name': 'V',
      'group': 'BTS',
    },
  ];
  print(people); //[{name: 지수, group: 블랙핑크}, {name: 로제, group: 블랙핑크}, {name: RM, group: BTS}, {name: V, group: BTS}]
//-----------------------------------------------------------------------
  final blackPinkPeople = people.where((e) => e['group'] == '블랙핑크');
  final bts = people.where((e) => e['group'] == 'BTS');

  print(blackPinkPeople); //({name: 지수, group: 블랙핑크}, {name: 로제, group: 블랙핑크})
  print(bts);//({name: RM, group: BTS}, {name: V, group: BTS})
```

#### ✏️ reduce 실습코드

```dart
  List<String> words = ['안녕하세요 ', '저는 ', '코드팩토리입니다. '];
  final sentence = words.reduce((prev, next) => prev + next);
  final count = words.fold<int>(0, (prev, next) => prev + next.length);
  print(sentence);//안녕하세요 저는 코드팩토리입니다.
  print(count);//19
```

### ✅ fold, cascading operator

fold는 reduce와 달리 반환값이 정해진 것이 아니기 때문에 선언해주어야 한다. 처음 prev에는 선언해준 값이 되고, next는 리스트의 첫째값이 들어가게 된다. 아무 형태나 리턴할 수 있고, 밑의 실습코드처럼 리스트의 길이 값을 구하는 것도 가능하다.

#### ✏️ fold 실습코드

```dart
void main() {
  List<int> numbers = [1,3,5,7,9];
  final sum = numbers.fold<int>(0,(prev,next)=>prev+next);
  print(sum); //25
}
//______________________________________

  List<String> words = ['안녕하세요 ', '저는 ', '코드팩토리입니다. '];
  final count = words.fold<int>(0, (prev, next) => prev + next.length);
  print(count);//19
```

#### ✏️ cascading operator 실습코드

리스트 앞에 `...`을 써주면 대괄호([])를 없애준다고 생각하면 쉽다. ...한 리스트는 기존 리스트와는 다른 리스트이다.

```dart
  List<int> even = [2, 4, 6, 8];
  List<int> odd = [1, 3, 5, 7];
  print([...even, ...odd]);//[2, 4, 6, 8, 1, 3, 5, 7]
  print(even);//[2, 4, 6, 8]
  print([...even]);//[2, 4, 6, 8]
  print(even == [...even]);//false
```

### ✅ 데이터의 정형화

클래스를 통한 JSON 데이터의 정형화는 오타 수정, 제거 등 자유도를 제한하여 데이터의 구조를 믿을 수 있는 상태로 만들어 줄 수 있다.

```dart
  final parsedPeople =
      people.map((x) => Person(name: x['name']!, group: x['group']!));
  print(parsedPeople);
//(Person(name:지수,group:블랙핑크), Person(name:로제,group:블랙핑크), Person(name:RM,group:BTS), Person(name:V,group:BTS))
class Person {
  final String name;
  final String group;
  Person({
    required this.name,
    required this.group,
  });
  @override
  String toString() {
    return 'Person(name:$name,group:$group)';
  }
}
```

이때 toString을 사용하지 않으면 결과가 [Instance of 'Person', Instance of 'Person', Instance of 'Person', Instance of 'Person'] 이런 식으로 나오기 때문에 해당 메소드를 사용해주어야 한다.

> # Async Programming

💡 동기(synchronous)

---

특정 코드의 실행이 완료될 때까지 기다리고 난 후 다음 코드를 수행하는 것
설계가 간단하고 직관적이지만 결과가 주어질 때까지 아무것도 못하고 대기해야 한다.

💡 비동기(asynchronous)

---

특정 코드의 실행이 완료될 때까지 기다리지 않고 다음 코드들을 수행하는 것
동기보다 복잡하지만, 결과가 주어지는 동안 작업을 할 수 있어 자원을 효율적으로 사용할 수 있다.

---

CPU에서 작업을 처리할 때 작업을 처리하는 가장 작은 유닛의 단위는 스레드이다. 예를 들어 1+1이라는 작업(하나의 함수)을 실행하면 그 계산을 CPU가 계산을 해야할 것이다. 그 작업이 완료되기 전까지는 CPU를 사용할 수 없다. 이 작업이 완료된 후에야 작업을 시작할 수 있을 것이다. 만약 우리가 서버요청을 해야하는 상황을 생각해보자. 생각보다 많은 시간이 걸릴 수 있다. 컴퓨터에서 요청을 보내고, 그 서버에서 응답이 올때까지 시간을 낭비해야할 것이다. 이 비효율적인 과정은 예전 Synchronous Programming이 초래하던 단점이다. Asynchronous Programming은 서버 요청을 보낸 순간 CPU가 다른 작업을 받을 수 있는 상태가 되어 더 효율적으로 CPU를 사용하고 낭비하는 시간을 줄일 수 있다.

---

### ✅ Future

future를 사용해 미래에 받아올 값을 저장할 수 있다. 모든 타입을 다 future로 변경가능하다. async programming이 가능하게 해주는 기능 중 하나인 future delayed는 두 개의 파라미터를 받는다. 1번 파라미터는 지연을 하는 시간, 2번 파라미터는 실행할 함수를 나타낸다.

```dart
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  addNumbers(1, 1);
}

void addNumbers(int a, int b) {
  print('계산중 : $a + $b');
  Future.delayed(Duration(seconds: 2), () {
    print("계산 완료: $a+ $b = ${a + b}");
  });
  print('함수 완료'); //2초 기다리는 동안 실행되는 코드.
```

위의 코드를 실행 시킨 결과를 보자

```
계산중 : 1 + 1
함수 완료
(2s 뒤)
계산 완료: 1+ 1 = 2
```

함수완료라는 문구는 제일 뒤에 있지만, 딜레이된 코드보다 먼저 실행된뒤, 딜레이코드가 실행된다. CPU가 일을 하지 않는 순간에 다른 작업을 하는 코드를 짠 것이다.

### ✅ await

await를 사용한 함수는 무조건 async 함수이어야 하고, async 함수는 무조건 Future를 반환해야 한다 await 키워드를 만나면 해당 함수를 잠시 정지하고, await 키워드가 붙은 동작이 완료될 때까지 기다린다.

```dart
Future<void> addNumbers(int a, int b) async {
  print('계산중 : $a + $b');
  await Future.delayed(Duration(seconds: 2), () {
    print("await 계산 완료: $a+ $b = ${a + b}");
  });

  print('함수 완료');
```

#### 🗒️ 출력

```
계산중 : 2 + 2
await 계산 완료: 2+ 2 = 4
함수 완료
```

CPU는 await 하는 중에도 다른 작업을 할 수도 있다.

```dart
void main() {
  Future<String> name = Future.value("코드팩토리");
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  addNumbers(1, 1);
  addNumbers(2, 2);
}

void addNumbers(int number1, int number2) async {
  print("계산시작: $number1 + $number2");

  await Future.delayed(Duration(seconds: 2), () {
    print("계산 완료: $number1 + $number2 = ${number1 + number2}");
  });

  print("함수완료");
}
```

해당 코드에서 addNumbers(2,2)는 await 함수에서 대기하는 중에 실행이 된다. 만약 여기서 `addNumbers(2,2)`에서도 대기를 주고 싶다면 main도 유사하게 바꾸어주면 된다. async 입력 후 `Future<void> addNumbers~` 이런식으로 함수를 Future로 감싸둔 뒤, addNumbers를 main에서 사용시 awai를 사용하면 된다.

```dart
void main() async {
  Future<String> name = Future.value("코드팩토리");
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  await addNumbers(1, 1);
  await addNumbers(2, 2);
}

Future<void> addNumbers(int number1, int number2) async {
  print("계산시작: $number1 + $number2");

  await Future.delayed(Duration(seconds: 2), () {
    print("계산 완료: $number1 + $number2 = ${number1 + number2}");
  });

  print("함수완료");
}

```

### ✅ Stream

dart:async 로 import해온 뒤, StramController로 stream을 호출한다. listen을 통해 listener에게 값들을 전달한다.

```dart
import "dart:async";

void main(){
  final controller = StreamController();
  final stream = controller.stream;

  final streamListener1 = stream.listen((val){
    print("Listener 1 : $val");
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}
```

#### 🗒️ 출력

```
Listener 1 : 1
Listener 1 : 2
Listener 1 : 3
Listener 1 : 4
Listener 1 : 5
```

컨트롤러 스트림을 가져오면 기본적으로 한번 리스닝을 할 수 있는 리소스가 생긴다. 이때 `asBroadcastStream`이라는 함수를 붙여주고 스트림을 `BroadcastSream`으로 변경해주면 간단하게 여러번 리스닝을 할 수 있는 스트림을 만들 수 있다.

```dart
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.listen((val) {
    print("Listener 1 : $val");
  });

  final streamListener2 = stream.listen((val) {
    print("Listener 2 : $val");
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
```

#### 🗒️ 출력

```
Listener 1 : 1
Listener 2 : 1
Listener 1 : 2
Listener 2 : 2
Listener 1 : 3
Listener 2 : 3
Listener 1 : 4
Listener 2 : 4
Listener 1 : 5
Listener 2 : 5
```

즉석에서 데이터 스트림 값을 변경할 수 있는데, `where`을 사용해 바로 데이터가 들어오는 순간에 변형을 주거나 데이터를 다룰 수 있다.

```dart
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.where((val) => val % 2 == 0).listen((val) {
    print("Listener 1 : $val");
  });

  final streamListener2 = stream.where((val) => val % 2 == 1).listen((val) {
    print("Listener 2 : $val");
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
```

#### 🗒️ 출력

```
Listener 2 : 1
Listener 1 : 2
Listener 2 : 3
Listener 1 : 4
Listener 2 : 5

```

### ✅Yield

함수에서 return을 하면 값을 반환하고 종료한다. 스트림을 돌려주고 싶다면 future<>를 stream<>으로, async를 async\*로, return을 yield로 변경하면 된다.

```dart
void main() {
  calculate(2).listen((val){
    print("calculate(2) : $val");
  });
}

Stream<int> calculate(int number) async* {
  for(int i = 0; i < 5; i++) {
    yield i * number;
  }
}
```

#### 🗒️ 출력

```
calculate(2) : 0
calculate(2) : 2
calculate(2) : 4
calculate(2) : 6
calculate(2) : 8

```

async\*에서도 await 사용이 가능하다.

```dart

Stream<int> calculate(int number) async* {
  for(int i = 0; i < 5; i++) {
    yield i * number;
  }

  await Future.delayed(Duration(seconds : 3));
}
```

stream이 실행시 for 루프가 종료된 뒤 3초 후에 코드가 종료된다.

---

한 스트림이 끝난 뒤 다음 스트림을 진행시키고 싶다면, `yield*`를 사용한다. 실행시 해당 스트림이 모든 값을 가져온 뒤에 스트림이 종료되면, 다음 스트림이 진행된다.

```dart
void main() {
  playAllStream().listen((val){
    print(val);
  });
}

Stream<int> playAllStream() async* {
  yield* calculate(1);
  yield* calculate(1000);
}

Stream<int> calculate(int number) async* {
  for(int i = 0; i < 5; i++) {
    yield i * number;
  }

  await Future.delayed(Duration(seconds : 1));
}
```

#### 🗒️ 출력

```
0
1
2
3
4
0
1000
2000
3000
4000

```
