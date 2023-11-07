void main() {
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

  //cascading operator
  //...
  //리스트의 값들을 새로운 리스트로 펼쳐서 반환한다.
  //[even != ...even]

  print([...even, ...odd]);

  final List<Map<String, String>> people = [
      {
      'name':'로제',
      'group':'블랙핑크',
      },
      {
      'name':'지수',
      'group':'블랙핑크',
      },
      {
      '
      name':'RM',
      'group':'BTS',
      },
      {
      'name':'뷔',
      'group':'BTS',
      }   
    ];

    print(people);

    final parsedPeople = people.map((x) =>
    Person(
      name: x['name'],
      group: x['group'],
      ),
    ).toList();

    print(parsedPeople);

  class Person {
    final String name;
    final String group;

    Person({
      required this.name,
      required this.group,
    });
  }

  //Map은 자유도가 높아서 구조화가 안 됨.
  //class 선언으로 구조화를 해서 형식화를 하는 것이 중요
  //class의 기본값 = [Instances of ...]
  // ㄴ 바꾸는 법 : override

  @override
  String toString(){
    return 'Person(name: $name, group: $group)';
  };

}

// 함수형 프로그래밍을 사용하는 가장 큰 이유 : 간결함
// - 하지만 너무 간결함을 추구할 경우 협업에 힘들고 오랜 관리에 힘들 수 있다
// - 코드를 자르거나 코멘트를 다는 습관을 가지는 것을 추천.