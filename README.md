<<<<<<< HEAD
# 2023-02-Flutter-Study

[23-24 GDSC Sookmyung 4기] 1분기 스터디(Flutter)를 위한 저장소

## 👩‍💻 스터디원

- Core: 신경원, 신진영
- Member: 김나연, 김선화, 백승효, 한정현

## 🤝 스터디 소개

- [GDSC Sookmyung Flutter Study Notion](https://gdsc-sookmyung-23-24.notion.site/GDSC_Flutter_Study-e45b7baff7b44ebba2d00e83ed71bb35?pvs=4)
- [GDSC Sookmyung Flutter Study Tistory](https://dsc-sookmyung.tistory.com/category/Group%20Study%20%282023-2024%29/Flutter)

### 커리큘럼

| 주차  | 주제                      |          진척도          |
| ----- | ------------------------- | :----------------------: |
| 1주차 | Dart 언어 이해하기        | <ul><li>- [ ] </li></ul> |
| 2주차 | Flutter 시작하기          | <ul><li>- [ ] </li></ul> |
| 3주차 | UI 구성하기               | <ul><li>- [ ] </li></ul> |
| 4주차 | Widget State              | <ul><li>- [ ] </li></ul> |
| 5주차 | Data Fetch, FutureBuilder | <ul><li>- [ ] </li></ul> |
| 6주차 | API, Storage              | <ul><li>- [ ] </li></ul> |

## 💼 과제

- 과제 마감 : **매주 월요일 자정**까지
- 제출 내용: 강의 내용 요약(README) 및 실습 코드
- 과제 제출 방법
  - 스터디 레포에 각자의 이름으로 브랜치 생성 (ex.) `jinyoung`
  - 본인 GitHub으로 스터디 레포를 fork한다.
  - fork 한 레포에서 각자의 이름으로 폴더를 생성한다 (ex.) `신진영`
  - 자신의 이름 아래 주차별 폴더를 생성한다. (ex.)`week01`
  - Fork한 레포에 과제를 Commit
    - 커밋 메시지: `n주차: 학습 주제` (ex.) `1주차: async/await`
  - 월요일 자정 전까지 main 브랜치에 으로 PR 요청 - PR 제목: `n주차_이름`
    → 리드는 화요일 오전에 과제를 확인하고 merge한다.

## 👀 GDSC 팀블로그 작성

- 각 주차 주제별 기술 블로그 작성
- 작성 순서 : Core(1, 2주차) - 백승효(3주차) - 김선화(4주차) - 한정현(5주차) - 김나연(6주차)
=======
# 1주차 Flutter 공부
## 1강 정리
+ var: 변수, 자동으로 타입 유추
+ 변수 이름을 다시 선언하는 것은 불가능
+ '${string 안에 변수 넣기}'

+ dynamic: 타입 다 넣을 수 있음
    + var과 차이점: 한 번 선언한 타입으로 계속, 변경 불가능=var/변경 가능 dynamic

+ ?: null 들어갈 수 있다
+ !: null 들어갈 수 없다

+ final: 값을 변경할 수 없다 -빌드 타임의 값을 알고 있지 않아도 된다.(type 생략 가능)
+ const: 바꿀 수 없다 -빌드 타임의 값을 알아야 선언 가능.(type 생략 가능)
    + DateTime now= DateTime.now();<=(코드가 실행이 되는 순간의 시간) =>const로는 x, final만 됨
    + 빌드 타임: 작성하는 순간의 코드의 값

+ ??= : null일때 값을 오른쪽 값으로 바꿔라.
+ is 변수 type 확인(is!)

+ List<type> 변수명=[];
    + ex) List<int> numbers= [1, 2, 3, 4];
+ Map<Key, Value> 변수명={어쩌구:저쩌구, ...}
+ Set : 알아서 중복값 처리

+ enum= type인 것처럼 쓰임
+ typedef도 알아놓기
------------------
## 2강 정리
+ class와 instance: 붕어빵틀과 붕어빵
+ this: 이 클래스를 의미함

+ instance 내에서 값을 바꾸지 못하게 하기 위해 class에서 final로 선언을 하거나 const를 사용한다.
+ const constructor 사용: 모든 멤버들이 같은 다른 instance가 같은 instance로 구분된다.(const를 사용하지 않으면 다른 instance로 구분됨.)

+ getter: 데이터를 가져올 때
    + ex)String get firstMember{
        return this.members[0];
        }
+setter: 데이터를 설정할 때
    + ex)set firstMember(String name){
         this.members[0]=name;
         }
=>사용하는 이유:데이터를 간단하게 가공할 때(set은 잘 안씀)

+ private: _를 사용하면 속성을 부여할 수 있다. 다른 파일에서는 사용할 수 없게 만든다
+ inheritance(상속): 부모 클래스의 모든 속성을 자식 클래스가 부여 받는다.
+ extends를 통해 상속받을 수 있음, 부모 클래스를 지칭하는 것은 super
+ private: _를 사용하면 속성을 부여할 수 있다. 다른 파일에서는 사용할 수 없게 만든다
+ inheritance(상속): 부모 클래스의 모든 속성을 자식 클래스가 부여 받는다.
+ extends를 통해 상속받을 수 있음, 부모 클래스를 지칭하는 것은 super

+ method: class 내부에 있는 함수
+ override: 덮어 쓰는 것 (method를 덮어씌울 수 있다)
    + @override를 통해 할 수 있다. 부모 클래스에 값을 불러오려면 super를 사용하면 된다.

+ static: instance에 귀속되지 않고 class에 귀속된다.
+ interface: implements라는 키워드를 쓴다.(똑같은 형태를 만들도록 강제하는 역할)
+ abstract: instance로 못쓰게 하는 용도. static과 같이 사용. 함수의 body를 지워도 된다.

+ generic: <>로 사용할 수 있다. 타입을 외부에서 받을 때 사용
>>>>>>> 3e0ee3c (1주차: async/await)
