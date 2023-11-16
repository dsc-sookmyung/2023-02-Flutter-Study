모든 위젯인 build 메소드를 구현해야 한다.
build 메소드는 위젯의 UI를 만드는 일

선언형임!!
위젯이 된다는 것 -> 계약을 맺는 것 (build method) 
-> 빌드는 메소드를 리턴해야 함

StatelessWidget은 가장 기ㅗㄴ적이고 쉬운 상속 위젯

@override
: 부모 class에 이미 있는 메소드를 override

scaffold
:화면의 구성/구조. 중앙 정렬이나 네비 바 등 다 스캐폴드가 필요

위젯에 마우스 호버로 constructor을 볼 수가 있다
위젯을 사용할 때마다 class를 인스턴스화 중
=> new를 쓸 필요가 없다

class 안 ? 가 붙으면 변수가 필수가 아니라는 것을 의미함 = optional