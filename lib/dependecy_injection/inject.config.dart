// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:storefront/core/network/dio_manager.dart' as _i1052;
import 'package:storefront/dependecy_injection/inject.dart' as _i987;
import 'package:storefront/localization/helper/bloc/language_bloc.dart' as _i875;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<_i875.LanguageBloc>(() => _i875.LanguageBloc());
    gh.factory<String>(
      () => dioModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i1052.DioManager>(() => _i1052.DioManager(gh<String>(instanceName: 'baseUrl')));
    return this;
  }
}

class _$DioModule extends _i987.DioModule {}
