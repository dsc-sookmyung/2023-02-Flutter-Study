# 3주차 UI CHALLENGE
## 3.0 Header
예시로 보여준 플러터 화면과 동일하게 만들어보자~!
플러터의 장점인 자유도를 이용하여 여러 아이콘들과 카드들을 이용.

colors 지정 싱에 색상 이름 뿐만 아니라 .withOpacity(0.x) 를 이용하여 투명도를 줄 수 있다.

Column 위젯은 서로를 위 아래에 두고 싶을 때, Row 위젯은 좌우에 놓고 싶을 때 사용한다.
mainaxis는 위젯의 메인 방향, crossaxis는 반대 방향이다. 
## 3.1 Developer Tools

## 3.2 Button Section
동일한 모양의 버튼을 2개 나란히 만들기 위해 row 위젯을 사용한다.
padding widget과 symmetric 요소를 이용하여 대칭을 맞출 수 있다는 점이 편리한듯.

## 3.3 VSCode Settings
계속 거슬리게 발생하는 파란색 오류 줄을 고쳐보자.
settings.json 파일에서 
```dart
"editor.codeActionsOnSave": {
            "source.fixAll": true
        },
"dart.previewFlutterUiGuides": true,
```

해당 내용을 추가하면 자동으로 const를 초가해주고, 부모자식 관계를 시각적으로 보여줘편하게 작업할 수 있다!

## 3.4 Code Actions
" ctrl + " 동작으로 열 번호 옆의 전구 아이콘을 켜 해당 구역을 패딩, 위젯 등으로 편리하게 오류 없이 감쌀 수 있다니
매번 ctrl x ctrl v 하지 않아도 빠르게 코드를 작성할 수 있다.

## 3.5 Reusable Widgets
같은 코드, 위젯 코드 등을 반복하는 것은 매우 비효율적인 일이다.
main.dart 파일이 있는 폴더인 lib 안에 위젯 폴더와 버튼 파일을 만들어 custom된 위젯을 만들 수 있다!

## 3.6 Cards
row, column 기능이 text를 정렬하고, 원하는 위치에 sizedbox 등을 함께 사용하여 배치하는 것이 매력적이다.
boxdecoration, padding우로 우리가 원하는 박스 모양과 색상을 이용할 수 있다.
이번 박스를 만들면서 점점 예시 화면과 똑같아지는 것을 보고 플러터의 유연함을 느낌.

강의와 padding이나 sizedbox의 크기 값을 아예 동일하게 하면 화면 크기가 달라 약간 다르게 보여 응용해서 숫자 값들을 조금씩 바꾸면서 하는 중이다~

## 3.7 Icons and Transforms
해당 이미지에 맞는 아이콘을 삽입해보자. flutter 내부에 자체적으로 굉장히 많은 아이콘들이 있기에 따로 다운로드 없이 이용 가능
row와 column 의 자손 관계가 약간 헷갈리지만 문단을 접어보며 직접 확인 가능해 편하게 작업 가능했다.

## 3.8 Reusable Cards
위에서 만든 카드들을 코드 낭비 없이 재사용할 수 있도록 위젯을 만들어보자
button 위젯을 만들었던 것처럼 currency card 위젯을 만듦.
isInverted 요소도 만들어 색상을 반전시키는 기능도 실행해 보았다.

Transform.translate(Offset) 으로 해당 child 코드가 x, y 축 방향으로 몇 픽셀 씩 움직이면 좋을지 직접 설정 가능하다. 강의와 숫자가 다르더라도 내 화면에 맞게 자연스럽고 빨리 변환할 수 있음.
