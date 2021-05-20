# Space launches

Here is a source code for the mobile application that displays a list of the upcoming space mission launches, implemented with [Flutter](https://flutter.dev/) and showcasing code-generation application in API models, API services, dependency injection, and navigation.

![Screenshots](https://raw.githubusercontent.com/foxanna/flutteristas_conf_2021/main/assets/Screenshot_1_2.png)

## API

The application obtains data from the ["Launch Library 2" API](https://ll.thespacedevs.com/2.0.0/swagger) by [The Space Devs](https://thespacedevs.com/). No API key is required.

## Installation

The generated files are not included. Before running the app make sure to execute

```sh
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## Flutteristas conference 2021

This repository complements the ["Code less, deliver more"](https://youtu.be/tcixn1Y1Y-Q) talk by [Anna (Domashych) Leushchenko](https://github.com/foxanna) at the [Flutteristas conference](https://twitter.com/FlutteristasCon) 2021. Slides are included.

![Presentation cover](https://github.com/foxanna/flutteristas_conf_2021/blob/main/assets/cover.png?raw=true)
