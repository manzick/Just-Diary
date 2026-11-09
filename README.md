# Just Diary

[![iOS 15.0+](https://img.shields.io/badge/iOS-15.0%2B-blue?logo=apple)](https://developer.apple.com/ios/)
[![macOS 13.0+](https://img.shields.io/badge/macOS-13.0%2B-blue?logo=apple)](https://developer.apple.com/macos/)
[![Swift 5](https://img.shields.io/badge/Swift-5-orange?logo=swift&logoColor=white)](https://swift.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

English | [Русский](README.ru.md)

A project for learning SwiftUI. An application for recording memories. Kind of like a journal.

Entries are grouped by year and month. The app runs on iPhone, iPad and Mac, supports light and dark mode, English and Russian.

- **UI:** SwiftUI. Native iPad layout with a sidebar that adapts to any window size, including windowed mode. On Mac, settings and new entries open in separate windows.
- **Architecture:** MVVM with business logic in use cases.
- **Data:** Core Data, state is shared through RxSwift (`BehaviorRelay`).
- **Backup:** export and import of all entries as JSON.
- **Statistics:** number of entries, words and years.
- **Tests:** XCTest.

SwiftUI - ❤️

## Screenshots

<p align="center">
  <img src="Screenshots/iphone-main-en.png" width="250">&nbsp;
  <img src="Screenshots/iphone-list-en.png" width="250">&nbsp;
  <img src="Screenshots/iphone-note-en.png" width="250">
</p>
<p align="center">
  <img src="Screenshots/iphone-main-dark-en.png" width="250">&nbsp;
  <img src="Screenshots/iphone-settings-en.png" width="250">&nbsp;
  <img src="Screenshots/iphone-statistic-en.png" width="250">
</p>
<p align="center">
  <img src="Screenshots/ipad-en.png" width="780">
</p>

## License

The code is licensed under the [MIT License](LICENSE).

Telegram icon by [Icons8](https://icons8.com). X logo from [Simple Icons](https://simpleicons.org) (CC0).
