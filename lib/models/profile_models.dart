class ListProfile {
  int? id;
  String? name;
  String? username;
  String? email;
  ListAddress? address;
  String? phone;
  String? website;
  ListCompany? company;

  ListProfile({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory ListProfile.fromJson(Map<String, dynamic> json) => ListProfile(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: ListAddress.fromJson(json['address']),
        phone: json["phone"],
        website: json["website"],
        company: ListCompany.fromJson(json['company']),
      );
}

class ListAddress {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  ListGeo? geo;

  ListAddress({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory ListAddress.fromJson(Map<String, dynamic> json) => ListAddress(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: ListGeo.fromJson(json['geo'])
      );
}

class ListCompany {
  String? name;
  String? catchPhrase;
  String? bs;

  ListCompany({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory ListCompany.fromJson(Map<String, dynamic> json) => ListCompany(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );
}

class ListGeo {
  String? lat;
  String? lng;

  ListGeo({
    this.lat,
    this.lng,
  });

  factory ListGeo.fromJson(Map<String, dynamic> json) => ListGeo(
        lat: json["lat"],
        lng: json["lng"],
      );
}
