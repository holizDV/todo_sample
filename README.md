# Todolist
## Installation
- Add [Flutter](https://flutter.dev/docs/get-started/install 'Flutter') to your machine
- Open this project folder with Terminal/CMD
- Ensure there's no cache/build left over by running `flutter clean` in the Terminal
- Run in the Terminal `flutter pub get`
- Run in the Terminal `dart run build_runner build --delete-conflicting-outputs`

## Before Run
- Make sure the .env(dev) file is in the root folder

## Running the App
- Open Android Emulator
- Run `flutter run --flavor {RELEASE_TYPE}`
- Supported release type: `dev` and `prod`

## Build an APK
- Run `flutter build apk` or Run `flutter build apk --flavor {RELEASE TYPE} --split-per-abi` for split the APK

## APK file
- folder doc/apk

