import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:space_launches/api/models/space_launch.dart';

part 'space_launch_api_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "https://ll.thespacedevs.com/2.0.0/")
abstract class SpaceLaunchApiService {
  @factoryMethod
  factory SpaceLaunchApiService(Dio dio, {String? baseUrl}) =
      _SpaceLaunchApiService;

  @GET('/launch/upcoming')
  Future<UpcomingLaunches> getUpcomingLaunches();

  @GET('/launch/{id}')
  Future<SpaceLaunch> getUpcomingLaunch(@Path("id") String id);
}

Future<UpcomingLaunches> example() =>
    SpaceLaunchApiService(Dio()).getUpcomingLaunches();
