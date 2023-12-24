# 6 Webtoon App
## 6.0 Introduction
제작자가 만든 unofficial API를 사용할 예정이다. 웹툰의 제목, 썸네일, ID를 받을 수 있다.

## 6.1 AppBar
위젯은 ID 같은 식별자 역할을 하는 key가 있음
home_screens 라는 파일을 하나 더 만들어 메인 파일과 연결하자.

## 6.2 Data Fetching
데이터 패칭을 위해 http의 json 정보를 받아오려면 패키지 설치를 해야 한다.
pubspec.yaml 파일은 해당 프로젝트의 정보가 들어 있어 여기서 설치 가능.

어떤 일이 일어날 때까지 기다린 후 실행하는 것이 async , 비동기 프로그래밍. 프로그램이 side effect를 기다리게 하는 것. 서버가 응답할 때까지 프로그램을 기다리라고 하는 것.
async 내에서 await 요소 사용 가능

응답을 response에 저장하여 이후 코드를 실행한다.

## 6.3 fromJson
Json 형식의 데이터를 클래스로 바꾸자
기존 데이터의 형식은 string이어서 해당 형식을 json으로 바꿔줌
```dart
final List<dynamic> webtoons = jsonDecode(response.body);
```

API로부터 받은 JSON으로 새로운 WebtoonModel을 만들자. webtoon 변수를 만들어 리스트로 반환한다.


## 6.5 waitForWebToons
전의 API로부터 받은 데이터를 화면에 출력해보자.
데이터를 fetch해 State에 넣음
initState가 build 메소드가 호출되기 전에 호출되고, waitforWebtoon 메소드 호출하게 되며 Future 객체를 미리 반환. build 메소드를 실행하고 데이터가 잘 전달되면 Future 객체 내의 setState 호출


## 6.6 FutureBuilder
Future을 사용하여 비동기작업을 하는 위젯을 사용해 StatefulWidget 대신 StatelessWidget을 사용할 수 있게 되었음.

## 6.7 ListView
ListView.builder는 모든 아이템을 한 번에 만드는 대신 만들려는 아이템에 itemBuilder 함수를 실행해 빌드되는 아이템의 인덱스에 접근할 수 있다.

## 6.8 Webtoon Card
필요할 때만 로드하는 ListView. 레이아웃은 column 안에 있는데 무한한 높이를 가지고 정확한 값을 모른다. 
Expanded 위젯을 활용하여 공간을 효율적으로 활용하게 한다.

clipBehavior: Clip.hardEdge 을 설정하여 boxdecoration이 정삭적으로 작동되도록 한다.

## 6.9 Detail Screen
webtoon_widget 파일을 새로 생성하여 안의 컴포넌트, 위젯 자체를 분리하여 연결했다.
탭 이벤트를 감지해 GestureDector 위젯을 사용하자.
navigator.push로 어떤 행동을 할 지 정할 수 있는데, route 요소는 statelesswidget을 애니메이션 효과로 감사 스크린처럼 보이게 할 수 있다.

## 6.10 Hero
Hero 위젯은 애니메이션을 제공한다. 각각의 코드에 같은 hero 위젯을 적용하고 같은 태그를 주면 된다!

## 6.11 Recap

## 6.12 ApiService
URL fetch를 해보자. 웹툰의 정보를 얻을 수 있음
이전과 같이 json으로 초기화한 클래스로 두 개의 메소드를 받아옴. 웹툰을 한개 받아오는 메소드와 ID 값에 따른 리스트 메소드를 받아온다. 

## 6.13 Futures
statelesswidget에서는 부모의 이름 없이 그냥 title, id 등으로만 적어주면 되지만
statefulwidget에서는 부모의 이름가지 widget.title, widget.id 등으로 적어줘야 한다.

future와 initAtate를 활용하고, initstate가 무조건 한 번 실행된 후에 build된다는 사실도 알 수 있다.

## 6.14 Detail Info
UI를 만들어보자
아주 간단하게 웹툰을 클릭하면 설명과 연령이 뜨도록 한다. 
snapshot.data!.about 스냅숏의 데이터를 불러와

## 6.15 Episodes
episode list를 만들어보자.
ListView는 여러 요소를 다루는 데 최적화되어 있지만 구현하기 따다롭고, Column은 return 이 중요할 때 사용
episode들을 각각의 박스로 만들어 꾸미고 다음 url launcher에서 버튼을 활성화한다. 

## 6.16 Url Launcher
flutter 내에서 웹에 연결하기 위해 url launcher를 설치한다. 현재 android에서 작업중이기 때문에 AndroidManifest.xml 파일에서 작업을 수정한다. 
onButtonTap() async {
    await launchUrlString("https://google.com");
  }

button에 GestureDetector를 설정하여 클릭하면 들어갈 수 있도록. 
코드의 간결성을 위해 episode_widget으로 위젯 파일을 만들어 import 해준다. 
container가 tap하는 것을 감지하기 위해 GestureDetector를 설정

id 값으로 url을 지정해서 클릭하면 해당 웹툰 링크로 연결~

## 6.17 Favorites
타이틀 옆에 하트 아이콘을 더해 즐겨찾기를 표시하자
해당 데이터를 앱에 저장하기 위해서는 shared_preferences 패키지를 이용.

onHeartTap이라는 함수를 새로 만들어 해당 버튼을 클릭할 때마다 이모티콘이 바뀌도록.
데이터를 저장하기 위해 
Future initPrefs() async {
    prefs = await SharedPreferences.getInstance(); 와 같이 지정. 