// refresh_token_usecase.dart
import 'package:injectable/injectable.dart';
import 'package:storefront/features/auth/data/auth_repository.dart';

/// A use case class that refreshes the access token from the repository.
@injectable
class RefreshTokenUseCase {
  final AuthRepository repository;

  RefreshTokenUseCase({required this.repository});

  Future<Map<String, dynamic>> call(String refreshToken) async {
    return await repository.refreshToken(refreshToken: refreshToken);
  }
}
