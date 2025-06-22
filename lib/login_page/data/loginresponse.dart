class LoginResponse {
  final String accessToken;
  final String refreshToken;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final meta = json['data']?['meta'];
    return LoginResponse(
      accessToken: meta?['accessToken'] ?? '',
      refreshToken: meta?['refreshToken'] ?? '',
    );
  }
}
