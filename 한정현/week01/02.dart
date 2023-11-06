void main() {
  Map<String, String> harryPortter = {
    'Harry Potter' : '해리 포터',
    'Ron Weasley' : '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저'
  };

  final result = harryPotter.map{
    (key, value) => MapEntry(
      'Harry Potter Character $key'
      '해리포터 캐릭터 $value',
    ),
  }

  //MapEntry를 통해서 key와 value를 넣어 새로운 값을 return 할 수 있다. 
  //맵도 맵핑이 가능하다는 점. 하지만 흔한 경우는 아니다.

  print(harryPotter);
  print(result);

  final keys = harryPotter.keys.map((x) => 'HPC $x').toList();
  final values = harryPotter.values.map((x) => '해리포터 $x').toList();

  print(keys);
  print(values);

  //key, list 값만 따로 리스트 형태로 바꿀 수도 있다. 

  Set blackPinkSet = {
    '로제',
    '지수',
    '제니',
    '리사',  
    };

    final newSet = blackPinkset.map((x) => '블랙핑크 $x').toSet();
    print(newSet);

    List<Map<String, String>> people = [
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

    final blackPink = people.where((x) => x['group'] == '블랙핑크');
    print(blackPink);
    //true를 돌려주면 값을 keep, false 돌려주면 값을 삭제
    //특정 인자를 선택해 선택한 값만 출력됨
}