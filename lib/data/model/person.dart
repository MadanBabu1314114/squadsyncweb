class Person {
 final  String firstName;
 final  String middleName;
 final  String lastName;
 final  String gender;
 final  String birthDate;
 final  String contact;
 final  String emailId;
 final  String nationality;
 final  int isActive;
 final  int organizationId;

  Person({
   required this.firstName,
   required this.middleName,
   required this.lastName,
   required this.gender,
   required this.birthDate,
   required this.contact,
   required this.emailId,
   required this.nationality,
   required this.isActive,
   required this.organizationId,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      firstName: json['first_name'],
      middleName: json['middle_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      birthDate: json['birth_date'],
      contact: json['contact'],
      emailId: json['email_id'],
      nationality: json['nationality'],
      isActive: json['is_active'],
      organizationId: json['organization_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['birth_date'] = birthDate;
    data['contact'] = contact;
    data['email_id'] = emailId;
    data['nationality'] = nationality;
    data['is_active'] = isActive;
    data['organization_id'] = organizationId;
    return data;
  }
}
