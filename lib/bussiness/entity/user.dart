import 'package:hive/hive.dart';
part 'user.g.dart';
@HiveType(typeId: 0)
class UserToken {
  @HiveField(0)
  final String accessToken;

  UserToken({
    required this.accessToken,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      accessToken: json['access_token'],
    );
  }
}

