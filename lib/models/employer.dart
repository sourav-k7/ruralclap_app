class Employer {
  int? id;
  String? name;
  String? language;
  int? phone;
  int? rating;
  String? location;
  String? gender;

  Employer(
      {this.id,
      this.name,
      this.language,
      this.phone,
      this.rating,
      this.location,
      this.gender});

  Employer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    language = json['language'];
    phone = json['phone'];
    rating = json['rating'];
    location = json['location'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['language'] = language;
    data['phone'] = phone;
    data['rating'] = rating;
    data['location'] = location;
    data['gender'] = gender;
    return data;
  }
}
