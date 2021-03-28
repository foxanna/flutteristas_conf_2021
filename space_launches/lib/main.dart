import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:space_launches/api/models/space_launch.dart';
import 'package:space_launches/api/service/space_launch_api_service.dart';
import 'package:space_launches/di/injection.dart';

void main() {
  configureDI(environment: Environment.prod);
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
        body: FutureBuilder<UpcomingLaunches>(
          future: getIt<SpaceLaunchApiService>().getUpcomingLaunches(),
          builder: (context, snapshot) => snapshot.hasData
              ? LaunchesList(launches: snapshot.data!.results)
              : snapshot.hasError
                  ? Error(error: snapshot.error!)
                  : const Loading(),
        ),
      );
}

class LaunchesList extends StatelessWidget {
  const LaunchesList({Key? key, required this.launches}) : super(key: key);

  final List<SpaceLaunch> launches;

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemBuilder: (context, index) =>
            LaunchTile(spaceLaunch: launches[index]),
        separatorBuilder: (context, index) => Divider(),
        itemCount: launches.length,
      );
}

class LaunchTile extends StatelessWidget {
  const LaunchTile({Key? key, required this.spaceLaunch}) : super(key: key);

  final SpaceLaunch spaceLaunch;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Image.network(
          spaceLaunch.image,
          width: 60,
          fit: BoxFit.contain,
        ),
        title: Text(spaceLaunch.name),
        subtitle: Text('⏱ ${spaceLaunch.windowStart}'),
        trailing: spaceLaunch.status != null
            ? LaunchStatusWidget(status: spaceLaunch.status!)
            : null,
        onTap: () {},
      );
}

class LaunchStatusWidget extends StatelessWidget {
  const LaunchStatusWidget({Key? key, required this.status}) : super(key: key);

  final LaunchStatus status;

  static const _statuses = <String, String>{
    'Success': '🚀',
    'Go': '🟢',
    'TBD': '🟡',
  };

  @override
  Widget build(BuildContext context) => SizedBox(
        height: kMinInteractiveDimension,
        width: kMinInteractiveDimension,
        child: Center(
          child: Text(
            _statuses[status.name] ?? '',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}

class Error extends StatelessWidget {
  const Error({Key? key, required this.error}) : super(key: key);

  final Object error;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            '💔${error is Exception ? '\n$error' : ''}',
            textAlign: TextAlign.center,
          ),
        ),
      );
}
