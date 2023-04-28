// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kid_demo/data/local_datasource.dart' as _i3;
import 'package:kid_demo/data/rest_datasource.dart' as _i7;
import 'package:kid_demo/domain/kid_repository.dart' as _i6;
import 'package:kid_demo/features/home/cubit/home_cubit.dart' as _i8;
import 'package:kid_demo/features/home/cubit/view_kid_cubit.dart' as _i5;
import 'package:kid_demo/features/receive_kid/cubit/receive_kid_cubit.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.LocalDatasource>(() => _i3.LocalDatasource());
    gh.factory<_i4.ReceiveKidCubit>(() => _i4.ReceiveKidCubit());
    gh.factory<_i5.ViewKidCubit>(() => _i5.ViewKidCubit());
    gh.lazySingleton<_i6.KIDRepository>(() => _i6.KIDRepository(
          gh<_i7.RestDatasource>(),
          gh<_i3.LocalDatasource>(),
        ));
    gh.factory<_i8.HomeCubit>(() => _i8.HomeCubit(gh<_i6.KIDRepository>()));
    return this;
  }
}
