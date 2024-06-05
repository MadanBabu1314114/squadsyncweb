 class Address {
  double longitude;
  double latitude;
  String fullAddress;
  String street;
  String city;
  String state;
  String country;
  String postalCode;

  Address({
    required this.longitude,
    required this.latitude,
    required this.fullAddress,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
      'full_address': fullAddress,
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'postal_code': postalCode,
    };
  }
}
