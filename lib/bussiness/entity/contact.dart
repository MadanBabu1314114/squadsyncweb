class Player {
  final String firstName;
  final String lastName;
  final String email;
  final String userType;
  final String dob;

  Player(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.userType,
      required this.dob});

  Map<String, Object?> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'userType': userType,
      'dob': Player
    };
  }
}
