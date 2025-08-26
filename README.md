# KWord for English

영어 학습을 위한 플러터 애플리케이션입니다.

## 프로젝트 개요

이 프로젝트는 영어 단어 학습을 돕는 모바일 애플리케이션입니다. 플러터 프레임워크를 사용하여 iOS와 Android 모두에서 실행할 수 있습니다.

## 개발 환경

- **Flutter**: 3.32.5
- **Dart**: 3.8.1
- **플랫폼**: iOS, Android, Web, macOS, Windows, Linux

## 프로젝트 구조

```
lib/
├── main.dart          # 앱의 진입점
├── screens/           # 화면 위젯들
├── widgets/           # 재사용 가능한 위젯들
├── models/            # 데이터 모델들
├── services/          # 비즈니스 로직 서비스들
└── utils/             # 유틸리티 함수들
```

## 시작하기

### 필수 요구사항

- Flutter SDK (3.32.5 이상)
- Dart SDK (3.8.1 이상)
- Android Studio 또는 VS Code
- iOS 개발을 위한 Xcode (macOS에서만)

### 설치 및 실행

1. 프로젝트 클론
```bash
git clone [repository-url]
cd kword_for_english
```

2. 의존성 설치
```bash
flutter pub get
```

3. 앱 실행
```bash
flutter run
```

### 빌드

- **Android APK**: `flutter build apk`
- **iOS**: `flutter build ios`
- **Web**: `flutter build web`

## 개발 가이드라인

- 코드 스타일은 `analysis_options.yaml`에 정의된 린트 규칙을 따릅니다
- 새로운 기능 추가 시 적절한 테스트를 작성하세요
- 커밋 메시지는 명확하고 설명적으로 작성하세요

## 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다.

## 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 연락처

프로젝트에 대한 문의사항이 있으시면 이슈를 생성해주세요.
