class ServiceProvider {
  int? id;
  String? name;
  String? description;
  String? skills;
  int? phone;
  int? rating;
  String? location;
  int? age;
  String? language;
  String? gender;
  int? expectedPayment;

  ServiceProvider(
      {this.id,
      this.name,
      this.description,
      this.skills,
      this.phone,
      this.rating,
      this.location,
      this.age,
      this.language,
      this.gender,
      this.expectedPayment});

  ServiceProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    skills = json['skills'];
    phone = json['phone'];
    rating = json['rating'];
    location = json['location'];
    age = json['age'];
    language = json['language'];
    gender = json['gender'];
    expectedPayment = json['expected_payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['skills'] = skills;
    data['phone'] = phone;
    data['rating'] = rating;
    data['location'] = location;
    data['age'] = age;
    data['language'] = language;
    data['gender'] = gender;
    data['expected_payment'] = expectedPayment;
    return data;
  }
}
