import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class InjectableModule {
  Dio get dio => Dio();

  @Named('baseUrl')
  String get baseUrl => 'https://ll.thespacedevs.com/2.0.0/';
}
