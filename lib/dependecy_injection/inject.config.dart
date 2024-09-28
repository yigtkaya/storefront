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
import 'package:storefront/features/auth/bloc/auth_bloc.dart' as _i699;
import 'package:storefront/features/auth/data/auth_repository.dart' as _i674;
import 'package:storefront/features/auth/data/auth_repository_impl.dart' as _i465;
import 'package:storefront/features/auth/domain/use_cases/get_acces_token_use_case.dart' as _i174;
import 'package:storefront/features/auth/domain/use_cases/get_autharization_code_use_case.dart' as _i798;
import 'package:storefront/features/auth/domain/use_cases/get_refresh_token_use_case.dart' as _i518;
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
    gh.factory<_i875.LanguageBloc>(() => _i875.LanguageBloc());
    gh.singleton<_i1052.DioManager>(() => _i1052.DioManager());
    gh.factory<_i674.AuthRepository>(() => _i465.AuthRepositoryImpl(gh<_i1052.DioManager>()));
    gh.factory<_i174.GetAccessTokenUseCase>(() => _i174.GetAccessTokenUseCase(repository: gh<_i674.AuthRepository>()));
    gh.factory<_i518.RefreshTokenUseCase>(() => _i518.RefreshTokenUseCase(repository: gh<_i674.AuthRepository>()));
    gh.factory<_i798.GetAuthorizationCodeUseCase>(
        () => _i798.GetAuthorizationCodeUseCase(repository: gh<_i674.AuthRepository>()));
    gh.factory<_i699.AuthBloc>(() => _i699.AuthBloc(
          gh<_i798.GetAuthorizationCodeUseCase>(),
          gh<_i174.GetAccessTokenUseCase>(),
          gh<_i518.RefreshTokenUseCase>(),
        ));
    return this;
  }
}
