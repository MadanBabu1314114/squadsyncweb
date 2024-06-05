 class Education {
  final String educationQualification;
  final String educationDegreeIn;

  Education({
    required this.educationQualification,
    required this.educationDegreeIn,
  });

  Map<String, dynamic> toJson() {
    return {
      'education_qualification': educationQualification,
      'education_degree_in': educationDegreeIn,
    };
  }
}