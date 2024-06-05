class TokenResponse {
  final String message;
  final String access_token;
  final int status;

  TokenResponse({
    required this.message,
    required this.access_token,
    required this.status,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      message: json['message'],
      access_token: json['access_token'],
      status: json['status'],
    );
  }
}

