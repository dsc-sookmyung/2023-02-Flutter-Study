//#3 함수형 프로그래밍

void main() {
  List<String> blackPink = ['로제', '지수', '리사', '제니'];

  // List = 배열, < > 사이에 데이터 타입 선언
  //List에는 모두 Map이라는 Method를 가지고 있다.

  print(blackPink);
  print(blackPink.asMap());
  print(blackPink.toSet());

  Map blackPinkMap = blackPink.asMap();

  // key-value가 한 쌍으로 여러 쌍이 배열로 이루어짐

  print(blackPinkMap.keys.toList());
  print(blackPinkMap.values.toList());

  Set blackPinkSet = Set.from(blackPink);

  // List와 동일하게 배열로 이루어지지만 중복값을 허용하지 않는다.
  // 그래서 List에서 중복값을 제거할 때 자주 사용

  print(blackPinkSet.toList());

  final newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x';
  });

  //() 안의 값에 각각의 함수 값을 받아 새로운 리스트를 출력
  //각 함수 값이 x에 들어가면서 대체값이 출력 -> 원본은 변하지 않음

  print(blackPink);
  print(newBlackPink);
  //(블랙핑크 로제, 블랙핑크 지수, 블랙핑크 리사, 블랙핑크 제니)
  print(newBlackPink.toList());
  //[블랙핑크 로제, 블랙핑크 지수, 블랙핑크 리사, 블랙핑크 제니]

  //toList()를 통해 배열로 출력 가능

  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');
  print(newBlackPink2.toList());

  String number = '13579';

  final parsed = number.split('').map((x) => '$x.jpg').toList();
  print(parsed);

  // split 기본 제공
}