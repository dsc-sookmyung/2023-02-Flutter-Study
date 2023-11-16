// stream : 개울
// ㄴ데이터가 yield라는 키워드를 사용해서 지속적으로 값을 받을 수가 있다. 데이터나 이벤트가 들어오는 통로이다.

import 'dart: async';

// stream은 기본 패키지 X

void main() {
  final controller = StreamController();
  final stream = controller.stream;

  final StreamListner1 = stream.where((val) => val % 2 == 0).listen((val){
    print('Listner 1 : $val');
  });

  final streamListner2 = stream.listen((val){
    print('Listner 2 : $val');
  });

  controller.sink.add(1);
}

void main2() {
  playAllStream().listen((val){
    print(val);
  });
}

Stream<int> playAllStream() async* {
  yield* calculate(1);
  yield* calculate(1000);
}


Stream<int> calculate(int number) async* {
  for (int i=0; i<5; i++){
    yield i * number;

    await Future.delayed(Duration(seconds: 1)); 
  }
  //yield가 실행될 때마다 calculate 함수를 리스닝하고 있는 리스너에 값을 뿌릴 수 있다.
}

//stream을 통해 await과 비슷한 기능을 사용할 수 있다.