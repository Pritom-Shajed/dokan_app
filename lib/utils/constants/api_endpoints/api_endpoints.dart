class ApiEndpoints {
  ApiEndpoints._();

  static String regUrl = 'wp/v2/users/register';
  static String loginUrl = 'jwt-auth/v1/token';
  static String userInfo = 'wp/v2/users/me';
  static String updateUser({required int userId}) => 'wp/v2/users/$userId';

}