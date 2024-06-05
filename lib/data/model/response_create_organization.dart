class ResponseCreateOrganization {
  final int id;
  final String legalName;
  final String telephone;
  final String orgType;
  final String organizationSport;
  final int organizationSportsId;
  final int addressId;
  final int affiliationId;

  ResponseCreateOrganization({
    required this.id,
    required this.legalName,
    required this.telephone,
    required this.orgType,
    required this.organizationSport,
    required this.organizationSportsId,
    required this.addressId,
    required this.affiliationId,
  });

  factory ResponseCreateOrganization.fromJson(Map<String, dynamic> json) {
    return ResponseCreateOrganization(
      id: json['id'],
      legalName: json['legal_name'],
      telephone: json['telephone'],
      orgType: json['org_type'],
      organizationSport: json['organization_sport'],
      organizationSportsId: json['organizationsports_id'],
      addressId: json['address_id'],
      affiliationId: json['affiliation_id'],
    );
  }
}
