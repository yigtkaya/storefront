import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  String get baseUrl => dotenv.env['BASE_URL'] ?? 'https://default-url.com';
}
