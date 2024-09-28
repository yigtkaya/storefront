import 'package:injectable/injectable.dart';
import 'package:storefront/core/network/dio_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:storefront/features/auth/data/auth_repository.dart';

@Injectable(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final DioManager dioManager;

  // Constructor that accepts a DioManager instance
  AuthRepositoryImpl(this.dioManager);

  @override
  Future<String> getAuthorizationCode() async {
    // Here you would handle redirecting the user to the authorization URL
    final clientId = 'your_client_id';
    final redirectUri = 'your_redirect_uri';
    final state = 'random_state_string';
    final authUrl = 'https://magaza-adiniz.myideasoft.com/panel/auth';

    final url = '$authUrl?client_id=$clientId&response_type=code'
        '&redirect_uri=$redirectUri&state=$state';

    // Open browser for user to authenticate (you can use url_launcher for this)
    final response = launchUrl(
      Uri.parse(url),
    );
    // Return the authorization code somehow (could be handled by a custom WebView, etc.)
    return 'authorization_code';
  }

  @override
  Future<Map<String, dynamic>> getAccessToken({
    required String code,
    required String redirectUri,
  }) async {
    final clientId = 'your_client_id';
    final clientSecret = 'your_client_secret';
    final tokenUrl = 'https://magaza-adiniz.myideasoft.com/oauth/v2/token';

    final response = await dioManager.dio.post(
      tokenUrl,
      data: {
        'grant_type': 'authorization_code',
        'client_id': clientId,
        'client_secret': clientSecret,
        'code': code,
        'redirect_uri': redirectUri,
      },
    );

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> refreshToken({
    required String refreshToken,
  }) async {
    final clientId = 'your_client_id';
    final clientSecret = 'your_client_secret';
    final tokenUrl = 'https://magaza-adiniz.myideasoft.com/oauth/v2/token';

    final response = await dioManager.dio.post(
      tokenUrl,
      data: {
        'grant_type': 'refresh_token',
        'client_id': clientId,
        'client_secret': clientSecret,
        'refresh_token': refreshToken,
      },
    );

    return response.data;
  }
}
