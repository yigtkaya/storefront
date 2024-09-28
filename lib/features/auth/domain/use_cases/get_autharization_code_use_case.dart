import 'package:injectable/injectable.dart';
import 'package:storefront/features/auth/data/auth_repository.dart';

/// A use case class that gets the authorization code from the repository.
@injectable
class GetAuthorizationCodeUseCase {
  final AuthRepository repository;

  GetAuthorizationCodeUseCase({required this.repository});

  Future<String> call() async {
    return await repository.getAuthorizationCode();
  }
}
