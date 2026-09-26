import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  TokenStorage([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _rememberMeKey = 'remember_me';

  final FlutterSecureStorage _storage;

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<void> saveRememberMe(bool rememberMe) async {
    await _storage.write(
      key: _rememberMeKey,
      value: rememberMe ? 'true' : 'false',
    );
  }

  Future<bool> readRememberMe() async {
    final value = await _storage.read(key: _rememberMeKey);
    return value == 'true';
  }

  Future<String?> readAccessToken() => _storage.read(key: _accessTokenKey);

  Future<String?> readRefreshToken() => _storage.read(key: _refreshTokenKey);

  Future<bool> hasTokens() async {
    final access = await readAccessToken();
    final refresh = await readRefreshToken();
    return access != null &&
        access.isNotEmpty &&
        refresh != null &&
        refresh.isNotEmpty;
  }

  Future<bool> hasSession() async {
    final rememberMe = await readRememberMe();
    if (!rememberMe) return false;
    final refresh = await readRefreshToken();
    return refresh != null && refresh.isNotEmpty;
  }

  Future<void> clear() => _storage.deleteAll();
}
