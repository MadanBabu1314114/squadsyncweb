class ResponseCreateOrgAdmin {
  final String message;
  final String firstName;
  final String lastName;
  final String emailId;
  final String organization;
  final int status;

  ResponseCreateOrgAdmin({
    required this.message,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.organization,
    required this.status,
  });

  factory ResponseCreateOrgAdmin.fromJson(Map<String, dynamic> json) {
    return ResponseCreateOrgAdmin(
      message: json['message'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      emailId: json['email_id'],
      organization: json['organization'],
      status: json['status'],
    );
  }
}
