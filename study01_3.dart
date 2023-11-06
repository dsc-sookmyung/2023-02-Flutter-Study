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
}
