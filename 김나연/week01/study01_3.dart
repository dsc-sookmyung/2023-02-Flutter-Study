void main() {
  List<String> blackPink = ['로제', '지수', '제니', '리사', '제니'];
  print(blackPink);
  print(blackPink.asMap());
  print(blackPink.toSet());
  
  Map blackPinkMap=blackPink.asMap();
  
  print(blackPinkMap.keys); //키값을 출력
  print(blackPinkMap.values.toList()); //리스트 형태로 value 값 출력
  
  Set blackPinkSet=Set.from(blackPink); //list=>set
  
  print(blackPinkSet.toList()); //set->list
  
  List<String> blackPink = ['로제', '지수', '제니', '리사'];
  final newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x';
  });

  print(blackPink);
  print(newBlackPink); //iterable 형태, 바꾸고 싶다면 .toList()

  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');
  print(newBlackPink2.toList());

  print(newBlackPink == newBlackPink2); //아예 새로운 list가 된다

  String number = '13579';
  final parsed = number.split('').map((x) => '$x.jpg').toList();
  print(parsed);

  //map key, value 값 출력하기
  Map<String, String> harryPotter = {
    'Harry Potter': '해리 포터',
    'Ron Weasley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저'
  };
  final result = harryPotter.map(
    (key, value) => MapEntry(
      'Harry Potter Character $key',
      '해리포터 캐릭터 $value',
    ),
  );
  print(harryPotter);
  print(result);
  final keys = harryPotter.keys.map((x) => 'HPC $x').toList();
  final values = harryPotter.values.map((x) => '해리포터 $x').toList();
  print(keys);
  print(values);

  //set: 리스트와 비슷한 형식
  Set blackPinkSet = {
    '로제',
    '지수',
    '제니',
    '리사',
  };
  final newSet = blackPinkSet.map((x) => '블랙핑크 $x').toSet();
  print(newSet);

  //where 함수: 원래 리스트를 변경하는 것이 아니라, 새롭게 만듦, 일종의 필터링 역할을 해준다.
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
  final blackPink = people.where((x) => x['group'] == '블랙핑크');
  final bts = people.where((x) => x['group'] == 'BTS').toList();
  print(blackPink);
  print(bts);

  //reduce: prev=맨 처음에만 첫번째, 그다음부터는 return해준 값. next=그 다음 값
   List<int> numbers = [1, 3, 5, 7, 9];
  final result = numbers.reduce((prev, next) {
    print('----------------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');

    return prev + next;
  });
  //final result = numbers.reduce((prev, next) => prev + next); 같은 값이 나옴
  print(result);

  List<String> words = [
    '안녕하세요',
    '저는',
    '코드팩토리입니다',
  ];
  final sentence = words.reduce((prev, next) => prev + next);
  print(sentence);
  //reduce는 원래 타입과 다른 타입은 return 할 수 없다.

  //fold<=reduce의 단점 보완
  List<int> numbers = [1, 3, 5, 7, 9];
  final sum = numbers.fold<int>(0, (prev, next) {
    print('----------------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');
  //실행하면 첫번째 값은 첫번째 인수로 받는 것을 알수 있다.

    return prev + next;
  });
  print(sum);

  final sentence = words.fold<String>('', (prev, next) => prev + next);
  print(sentence);
  final count = words.fold<int>(0, (prev, next) => prev + next.length);
  print(count); //fold는 타입을 바꿀 수 있다.

  //cascading operator: ...으로 사용한다.
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
  print([...even, ...odd]);
  print(even == [...even]); //값은 같지만 결과는 false로 나온다. cascading operator를 사용하면 새로운 list를 만드는 것이다.

  //map을 class로
  final parsedPeople = people
      .map(
        (x) => Person(
            name: x['name']!,
            group: x['group']! //map은 신뢰할 수 없기 때문에 !를 쓰지 않으면 오류가 난다.
            ),
      )
      .toList();
  print(parsedPeople); //override를 하지 않으면 Instance of 'Person' 값이 4번 나온다.
  //functional programming은 여러 개의 함수들을 연결해서 실행해도 된다.
  final result = people
      .map(
        (x) => Person(
            name: x['name']!,
            group: x['group']! //map은 신뢰할 수 없기 때문에 !를 쓰지 않으면 오류가 난다.
            ),
      )
      .where((x) => x.group == 'BTS')
      .fold<int>(0, (prev, next) => prev + next.name.length);
  print(result);
}

//map은 자유도가 높아 틀릴 확률이 높으므로 class로 바꿔 사용한다.
class Person {
  final String name;
  final String group;

  Person({
    required this.name,
    required this.group,
  });

   @override
  String toString() {
    return 'Person(name:$name),(group:$group)';
  }
}
