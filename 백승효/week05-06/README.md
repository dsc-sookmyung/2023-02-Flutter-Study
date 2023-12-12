### Week 05-06 Webtoon App

#### 1. HTTP 통신 세팅(pub.dev)

---

`https://pub.dev/packages/http`

해당 사이트에서 설치 가능한 라이브러리를 확인할 수 있다.

```dart
flutter pub add (라이브러리명)
```

보통 이런 식으로 설치한다.

```dart
//http 설치
flutter pub add http
//http 사용
import 'package:http/http.dart';
```

### 2 . API 데이터 받아오기

---

API 데이터를 가져올 때 json 형태의 구조를 앱에서 사용할 객체로 변환해야 한다. webtoon app에서 가져올 데이터는 title, thumb, id 이다.

```
// API 데이터
[
    {
    "id": "654774",
    "title": "소녀의 세계",
    "thumb": "https://image-comic.pstatic.net/webtoon/654774/thumbnail/thumbnail_IMAG21_4048794550434817075.jpg"
    },
    .
    .
    .
```

📝 해당 데이터를 변환하는 코드

```dart
class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
```

📝 api_service.dart

```dart
class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static String today = "today";


  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = []; // webtoonModel 타입의 인스턴스들이 들어가게 될 곳!
    final url = Uri.parse('$baseUrl/$today');
    // 접속할 url
    final response = await http.get(url);
    if (response.statusCode == 200) { //정상적으로 데이터가 받아와진 경우
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) { //for문을 돌면서 데이터들을 json 형식에서 객체 형태로 변환해주고 배열에 add 해준다.
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances; //웹툰 인스턴스들(우리가 받아온 데이터)를 최종 반환
    }
    throw Error();
  }
```

📝 main.dart

```dart
final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
//webtoons : 우리가 사용할 웹툰 인스턴스들 (타입은 webtoonModel)
```

### 3. Futurebuilder

---

위에서 받아온 api 데이터(webtoons)를 이제 화면에 보여줘야 한다. 이때 futureBuilder를 사용할 수 있다. Future와 마찬가지로 데이터가 다 받아와지기 전 데이터를 불러오는 것을 막아준다. FutureBuilder가 없다면 데이터가 다 받아지기를 기다린 후 화면을 그리거나 데이터의 변화을 setState()를 통해 바꿔야 줘야한다. FutureBuilder는 대부분 앨범에서 이미지 가져오기, 현재 배터리 표시, 파일 가져오기, http 요청 등 일회성 응답에 사용한다.

```dart
FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) { //데이터가 있을 경우
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                  //데이터를 보여주는 함수 실행. makeList는 따로 작성한 코드(ListView에서 설명할 예정)
                ),
              ],
            );
          }
          return const Center( //future가 불러와지기 전 data가 없으므로 로딩액션이 화면에 display된다.
            child: CircularProgressIndicator(),
          );
        },
      ),
```

### 4. ListViewBuilder

---

ListView 라는 기본 옵션도 있지만, 더 나아가 ListViewBuilder를 사용가능하다.

### 5. Hero

### 6. Url Launcher
