import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kid_demo/data/rest_datasource.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/dio_interceptors.dart';
import 'injection_container.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  sl.init();

  sl.registerLazySingleton<Dio>(
    () => Dio()
      ..interceptors.addAll(
        [
          JsonResponseConverterInterceptor(),
          PrettyDioLogger(),
        ],
      ),
  );
  sl.registerLazySingleton<RestDatasource>(
    () => RestDatasource(sl()),
  );
}
