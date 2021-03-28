import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:space_launches/routes/router.gr.dart';

@module
abstract class InjectableModule {
  Dio get dio => Dio();

  @dev
  @Named('baseUrl')
  String get baseUrlDev => 'https://ll.thespacedevs.com/2.0.0/';

  @prod
  @Named('baseUrl')
  String get baseUrlProd => 'https://ll.thespacedevs.com/2.0.0/';

  @lazySingleton
  SpaceLaunchesRouter get router => SpaceLaunchesRouter();
}
