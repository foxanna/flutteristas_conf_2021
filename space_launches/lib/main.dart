import 'package:flutter/material.dart';
import 'package:space_launches/di/injection.dart';

void main() {
  configureDI();
  runApp(SpaceLaunchesApp());
}

class SpaceLaunchesApp extends StatelessWidget {
  const SpaceLaunchesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Color(0xFFD1B2F4),
          primaryColorBrightness: Brightness.dark,
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(brightness: Brightness.dark),
        ),
        home: SpaceLaunchesListPage(),
      );
}

class SpaceLaunchesListPage extends StatelessWidget {
  const SpaceLaunchesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Space launches')),
        body: Container(),
      );
}
