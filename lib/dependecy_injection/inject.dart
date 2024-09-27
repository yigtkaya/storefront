import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:storefront/dependecy_injection/inject.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}

@module
abstract class DioModule {
  @Named('baseUrl')
  String get baseUrl => 'https://api.example.com'; // or pass it from a config file.
}
