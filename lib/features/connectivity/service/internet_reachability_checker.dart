import 'dart:async';
import 'dart:io';

class InternetReachabilityChecker {
  const InternetReachabilityChecker();

  static final Uri _probeUri = Uri.parse(
    'https://www.gstatic.com/generate_204',
  );

  static const Duration _timeout = Duration(seconds: 3);

  Future<bool> hasInternetAccess() async {
    HttpClient? client;
    try {
      client = HttpClient()..connectionTimeout = _timeout;
      final request = await client.getUrl(_probeUri).timeout(_timeout);
      final response = await request.close().timeout(_timeout);
      await response.drain<void>();
      return response.statusCode == 204 || response.statusCode == 200;
    } on Object {
      return false;
    } finally {
      client?.close(force: true);
    }
  }
}
