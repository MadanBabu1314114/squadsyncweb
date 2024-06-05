class Organization {
  String legalName;
  String telephone;
  String orgType;
  String organizationSport;
  String organizationDepartment;
  int affiliationId;

  Organization({
    required this.legalName,
    required this.telephone,
    required this.orgType,
    required this.organizationSport,
    required this.organizationDepartment,
    required this.affiliationId,
  });

  Map<String, dynamic> toJson() {
    return {
      'legal_name': legalName,
      'telephone': telephone,
      'org_type': orgType,
      'organization_sport': organizationSport,
      'organization_department': organizationDepartment,
      'affiliation_id': affiliationId,
    };
  }
}
