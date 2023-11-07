// CPU Thread : 작업을 하는 가장 작은 유닛

 void main() async {
  //Future - 미래
  // 미래에 받아올 값
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  final result1 = await addNumbers(1, 1);
  final result2 = await addNumbers(2, 2);

  // 2개의 파라미터
  // delayed - 지연되다.
  // 1번 파라미터 - 지연할 기간 (얼마나 지연할건지) Duration
  // 2번 파라미터 - 지연 시간이 지난 후 실행할 함수.
  Future.delayed(Duration(second: 2), () {
    print('Delay 끝');
  });

  //async가 없으면 await을 절대로 쓸 수 없다!
  //await으로 async코드를 논리적으로 기다릴수가 있다.
  //기다리는 동안 CPU는 다른 작업을 할 수 있다.

  Future<int> addNumbers(int number1, int number2) async {
    print('계산 시작: $number1 + $number2');

    //서버 시뮬레이션
    await Future.delayer(Duration(seconds: 2), () {
      print('계산 완료: $number1 + $number2 = $(number1 + number2)');
    });

    //위 자체를 async로 만들기 때문에 리소스 낭비 X

    print('함수 완료 : $number1 + $number2');

    return number1 + number2;
  }
 }