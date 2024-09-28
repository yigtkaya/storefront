/// [AuthRepository] abstract class is used to define the methods
///  that will be implemented by the [AuthRepositoryImpl] class.
abstract interface class AuthRepository {
  Future<String> getAuthorizationCode();
  Future<Map<String, dynamic>> getAccessToken({
    required String code,
    required String redirectUri,
  });
  Future<Map<String, dynamic>> refreshToken({
    required String refreshToken,
  });
}
