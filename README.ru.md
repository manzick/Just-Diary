# Just Diary

[![iOS 15.0+](https://img.shields.io/badge/iOS-15.0%2B-blue?logo=apple)](https://developer.apple.com/ios/)
[![macOS 13.0+](https://img.shields.io/badge/macOS-13.0%2B-blue?logo=apple)](https://developer.apple.com/macos/)
[![Swift 5](https://img.shields.io/badge/Swift-5-orange?logo=swift&logoColor=white)](https://swift.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

[English](README.md) | Русский

Проект для изучения SwiftUI. Приложение для записи воспоминаний, что-то вроде дневника.

Записи группируются по годам и месяцам. Приложение работает на iPhone, iPad и Mac, поддерживает светлую и тёмную тему, русский и английский языки.

- **UI:** SwiftUI. На iPad нативный интерфейс с боковой панелью, который подстраивается под любой размер окна, в том числе в оконном режиме. На Mac настройки и новая запись открываются в отдельных окнах.
- **Архитектура:** MVVM, бизнес-логика вынесена в use cases.
- **Данные:** Core Data, состояние раздаётся через RxSwift (`BehaviorRelay`).
- **Резервная копия:** экспорт и импорт всех записей в JSON.
- **Статистика:** количество записей, слов и лет.
- **Тесты:** XCTest.

SwiftUI - ❤️

## Скриншоты

<p align="center">
  <img src="Screenshots/iphone-main-ru.png" width="250">&nbsp;
  <img src="Screenshots/iphone-list-ru.png" width="250">&nbsp;
  <img src="Screenshots/iphone-note-ru.png" width="250">
</p>
<p align="center">
  <img src="Screenshots/iphone-main-dark-ru.png" width="250">&nbsp;
  <img src="Screenshots/iphone-settings-ru.png" width="250">&nbsp;
  <img src="Screenshots/iphone-statistic-ru.png" width="250">
</p>
<p align="center">
  <img src="Screenshots/ipad-ru.png" width="780">
</p>

## Лицензия

Код распространяется под [лицензией MIT](LICENSE).

Иконка Telegram от [Icons8](https://icons8.com). Логотип X из [Simple Icons](https://simpleicons.org) (CC0).
