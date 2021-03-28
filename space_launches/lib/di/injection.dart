import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:space_launches/di/injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDI({String? environment}) =>
    $initGetIt(getIt, environment: environment);
