class OrgId {
  final int id;
  final String orgIdName;

  OrgId({required this.id, required this.orgIdName});

  factory OrgId.fromJson(Map<String, dynamic> json) {
    return OrgId(
      id: json['id'],
      orgIdName: json['OrgId_name'],
    );
  }
}
