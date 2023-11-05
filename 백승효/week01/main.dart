import 'dart:async';

void main() {
  List<String> blackPink = ["로제", "지수", "제니", "리사", "제니"];
  print(blackPink);
  print(blackPink.asMap());
  print(blackPink.toSet());

  Map blackPinkMap = blackPink.asMap();
  print(blackPinkMap.keys.toList());
  print(blackPinkMap.values.toList());

  Set blackPinkSet = blackPink.toSet();
  print(blackPinkSet.toList());

  //-----------------------------------------------------------------------

  final newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x';
  });
  print(blackPink);
  print(newBlackPink);
  print(newBlackPink.toList());

  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');
  print(newBlackPink2.toList());

  print(blackPink == blackPink);
  print(newBlackPink == blackPink);
  print(newBlackPink == newBlackPink2);

  //-----------------------------------------------------------------------

  String number = '13579';
  final parsed = number.split('').map((x) => '$x.jpg').toList();
  print(parsed);

  //-----------------------------------------------------------------------

  Map<String, String> harryPotter = {
    'harry potter': '해리 포터',
    'Ron Weasley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저',
  };
  final result = harryPotter.map((key, vaule) =>
      MapEntry('Harry Potter Character $key', '해리포터 캐릭터 $vaule'));
  print(result);

  final keys = harryPotter.keys
      .map(
        (e) => 'HPC $e',
      )
      .toList();
  final values = harryPotter.values.map((e) => '해리포터 $e').toList();

  print(keys);
  print(values);

  //-----------------------------------------------------------------------
  final newSet = blackPinkSet
      .map(
        (e) => '블랙핑크 $e',
      )
      .toSet();
  print(newSet);
  //-----------------------------------------------------------------------
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
  print(people);
  //-----------------------------------------------------------------------
  final parsedPeople =
      people.map((x) => Person(name: x['name']!, group: x['group']!));
  print(parsedPeople);
//-----------------------------------------------------------------------
  final blackPinkPeople = people.where((e) => e['group'] == '블랙핑크');
  final bts = people.where((e) => e['group'] == 'BTS');

  print(blackPinkPeople);
  print(bts);

  //-----------------------------------------------------------------------
  List<int> numbers = [1, 3, 5, 7, 9];
  final resultNum = numbers.reduce((prev, next) {
    print('--------------------');
    print('previous : $prev');
    print('next : $next');
    print('previous + next : ${prev + next}');
    return prev + next;
  });

  print(resultNum);
  //-----------------------------------------------------------------------
  List<String> words = ['안녕하세요 ', '저는 ', '코드팩토리입니다. '];
  final sentence = words.reduce((prev, next) => prev + next);
  final count = words.fold<int>(0, (prev, next) => prev + next.length);
  print(sentence);
  print(count);
  //-----------------------------------------------------------------------
  List<int> even = [2, 4, 6, 8];
  List<int> odd = [1, 3, 5, 7];
  print([...even, ...odd]);
  print(even);
  print([...even]);
  print(even == [...even]);
  //-----------------------------------------------------------------------
}

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

//#4-----------------------------------------------------------------------

void main2() async {
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  //await addNumbers(1, 1);
  //await addNumbers(2, 2);

  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.where((val) => val % 2 == 0).listen((val) {
    print("Listener 1 : $val");
  });

  final streamListener2 = stream.where((val) => val % 2 == 1).listen((val) {
    print("Listener 2 : $val");
  });

  //--------------------------------------
  calculate(2).listen((val) {
    print("calculate(2) : $val");
  });
  //--------------------------------------
  playAllStream().listen((val) {
    print(val);
  });
}

Future<void> addNumbers(int a, int b) async {
  print('계산중 : $a + $b');
  await Future.delayed(Duration(seconds: 2), () {
    print("어웨잇계산 완료: $a+ $b = ${a + b}");
  });

  print('함수 완료'); //2초 기다리는 동안 실행되는 코드.
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number;
  }
  await Future.delayed(Duration(seconds: 1));
}

Stream<int> playAllStream() async* {
  yield* calculate(1);
  yield* calculate(1000);
}
