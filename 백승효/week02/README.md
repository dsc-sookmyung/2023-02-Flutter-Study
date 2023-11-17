## Week02 - 플러터 세팅(mac)

> MacBook Pro 13
> M2, 2022년 모델 /
> macOS - Sonoma 14.0

### 1. Flutter SDK 파일 다운로드

사양에 맞는 플러터 zip 파일을 다운 받고 압축해제 후 설치.
사용자 폴더 안 `.zshrc` 파일에 환경변수 설정을 해준다.

```bash
$ export PATH="$PATH:`pwd`/flutter/bin"
```

### 2. Android Studio 설치

### 3. Xcode 설치

### 4. cocoaPods 설치

```bash
$ sudo gem install cocoapods
```

### 5. flutter doctor 로 설치 확인하기

```bash
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.13.7, on macOS 14.0 23A344 darwin-arm64, locale
    ko-KR)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 15.0.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2022.3)
[✓] VS Code (version 1.83.1)
[✓] Connected device (2 available)
[✓] Network resources

• No issues found!
```

### 6. 플러터 프로젝트 생성 (Hello Flutter)
