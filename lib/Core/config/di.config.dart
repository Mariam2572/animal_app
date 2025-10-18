// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/Favorite/data/repos/data_source/fav_remote_contract.dart'
    as _i518;
import '../../features/Favorite/data/repos/data_source/fav_remote_impl.dart'
    as _i465;
import '../../features/Favorite/data/repos/repo/fav_repo.dart' as _i1056;
import '../../features/Favorite/data/repos/repo/fav_repo_impl.dart' as _i259;
import '../../features/home/data/repos/data_source/breeds_remote_data_source.dart'
    as _i185;
import '../../features/home/data/repos/data_source/breeds_remote_imp.dart'
    as _i259;
import '../../features/home/data/repos/repo/breeds_repo.dart' as _i631;
import '../../features/home/data/repos/repo/breeds_repo_impl.dart' as _i228;
import '../Network%20copy/api_services.dart' as _i492;
import '../Network%20copy/dio_modul.dart' as _i132;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i528.PrettyDioLogger>()),
    );
    gh.singleton<_i492.ApiService>(
      () => dioModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i185.BreedsRemoteContract>(
      () => _i259.BreedsRemoteImp(gh<_i492.ApiService>()),
    );
    gh.factory<_i518.FavRemoteContract>(
      () => _i465.FavRemoteImpl(gh<_i492.ApiService>()),
    );
    gh.factory<_i1056.FavRepo>(
      () => _i259.FavRepoImpl(gh<_i518.FavRemoteContract>()),
    );
    gh.factory<_i631.BreedsRepoContract>(
      () => _i228.BreedsRepoImpl(gh<_i185.BreedsRemoteContract>()),
    );
    return this;
  }
}

class _$DioModule extends _i132.DioModule {}
