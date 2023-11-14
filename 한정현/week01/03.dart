void main() {
  List<int> numbers = [
    1,
    3,
    5,
    7,
    9
  ];
  numbers.reduce((prev, next){
    print('-----------');
    print('previous: $prev');
    print('next: $next');
    print('total : ${prev + next}');

    return prev + next;
  });

  print(result);

  List<String> words = [
    '안녕하세요',
    '저는',
    '코드팩토리입니다.',
  ];

  final sentence = words.reduce((prev, enxt) => prev + next);
  print(sentence);

  //reduce의 절대적인 규칙
  // ㄴ 반환되는 값들의 타입이 각각의 태초가 된 리스트의 멤버들의 타입과 똑같아야 한다.
  // 즉 같은 타입을 return 해줘야 한다.

  //위의 불편한 점을 보완한 것이 Fold

  final sum = numbers.fold<int>(0, (prev,next) => prev + next)
  print(sum);
  //fold는 다른 타입이 반환되도 괜찮으니 반환될 값의 타입을 따로 지정해주면 된다.
}