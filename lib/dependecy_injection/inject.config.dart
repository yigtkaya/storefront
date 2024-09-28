// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:storefront/core/network/dio_manager.dart' as _i1052;
import 'package:storefront/dependecy_injection/inject.dart' as _i987;
import 'package:storefront/features/auth/bloc/auth_bloc.dart' as _i699;
import 'package:storefront/features/data/auth_repository.dart' as _i26;
import 'package:storefront/features/data/auth_repository_impl.dart' as _i636;
import 'package:storefront/features/domain/use_cases/get_acces_token_use_case.dart' as _i565;
import 'package:storefront/features/domain/use_cases/get_autharization_code_use_case.dart' as _i819;
import 'package:storefront/features/domain/use_cases/get_refresh_token_use_case.dart' as _i207;
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
    gh.factory<_i26.AuthRepository>(() => _i636.AuthRepositoryImpl(dio: gh<_i361.Dio>()));
    gh.factory<_i565.GetAccessTokenUseCase>(() => _i565.GetAccessTokenUseCase(repository: gh<_i26.AuthRepository>()));
    gh.factory<_i207.RefreshTokenUseCase>(() => _i207.RefreshTokenUseCase(repository: gh<_i26.AuthRepository>()));
    gh.factory<_i819.GetAuthorizationCodeUseCase>(
        () => _i819.GetAuthorizationCodeUseCase(repository: gh<_i26.AuthRepository>()));
    gh.factory<_i699.AuthBloc>(() => _i699.AuthBloc(
          gh<_i819.GetAuthorizationCodeUseCase>(),
          gh<_i565.GetAccessTokenUseCase>(),
          gh<_i207.RefreshTokenUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i987.DioModule {}
