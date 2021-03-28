import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class InjectableModule {
  Dio get dio => Dio();
}
