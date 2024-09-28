// get_authorization_code_usecase.dart
import 'package:injectable/injectable.dart';
import 'package:storefront/features/data/auth_repository.dart';

/// A use case class that gets the access token from the repository.
@injectable
class GetAccessTokenUseCase {
  final AuthRepository repository;

  GetAccessTokenUseCase({required this.repository});

  Future<Map<String, dynamic>> call(String code, String redirectUri) async {
    return await repository.getAccessToken(code: code, redirectUri: redirectUri);
  }
}
