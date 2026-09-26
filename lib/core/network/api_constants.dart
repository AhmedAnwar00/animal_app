abstract final class ApiConstants {
  static const baseUrl = 'http://192.168.100.15:8000';
  static const signup = '/api/signup';
  static const verificationCode = '/api/verfication_code';
  static const login = '/api/login';
  static const forgetPassword = '/api/forget_password';
  static const createNewPassword = '/api/create_new_possword';
  static const generateAccessToken = '/api/generateAccessToken';
  static const allCategories = '/api/allCategories';
  static const createNewCategory = '/api/createNewCategory';
  static const updateCategory = '/api/updateCategory';
  static const deleteCategory = '/api/deleteCategory';

  static String? resolveMediaUrl(String? path) {
    if (path == null) return null;
    final trimmed = path.trim();
    if (trimmed.isEmpty) return null;

    final base = Uri.parse(baseUrl);

    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      final uri = Uri.parse(trimmed);
      if (uri.host == 'localhost' || uri.host == '127.0.0.1') {
        return uri
            .replace(
              scheme: base.scheme,
              host: base.host,
              port: base.hasPort ? base.port : null,
            )
            .toString();
      }
      return trimmed;
    }

    if (trimmed.startsWith('/')) {
      return '$baseUrl$trimmed';
    }
    return '$baseUrl/$trimmed';
  }
}
