import 'package:space_launches/main.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SpaceLaunchesListPage, initial: true),
    AutoRoute(page: SpaceLaunchDetailsPage),
  ],
)
class $SpaceLaunchesRouter {}
